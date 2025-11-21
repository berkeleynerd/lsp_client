with Ada.Characters.Latin_1;
with Ada.Directories;
with Ada.Real_Time;
with Ada.Text_IO;

with GNAT.OS_Lib;

with AUnit.Assertions;
with AUnit.Test_Cases;
with AUnit.Test_Suites;

with GNATCOLL.VFS;

with GPS.LSP_Clients;
with GPS.LSP_Client.Utilities;
with GPS.LSP_Client.Configurations.ALS;
with GPS.LSP_Client.Language_Servers;
with GPS.LSP_Client.Language_Servers.Real;
with GPS.LSP_Client.Language_Servers.Interceptors;

with ALS_Integration_Callbacks;

with Language.Ada;

with LSP.Clients;
with LSP.Messages;
with LSP.Types;

with Spawn.String_Vectors;

with VSS.Strings.Conversions;

package body Integration_Tests is

   type Test is new AUnit.Test_Cases.Test_Case with null record;

   Global_Collector : aliased ALS_Integration_Callbacks.Diagnostics_Collector;

   overriding function Name (T : Test) return AUnit.Message_String;
   overriding procedure Register_Tests (T : in out Test);

   procedure ALS_Diagnostics_On_Typo
     (T : in out AUnit.Test_Cases.Test_Case'Class);

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      Ret : constant AUnit.Test_Suites.Access_Test_Suite :=
        AUnit.Test_Suites.New_Suite;
   begin
      AUnit.Test_Suites.Add_Test (Ret, new Test);
      return Ret;
   end Suite;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("ALS integration diagnostics");
   end Name;

   overriding procedure Register_Tests (T : in out Test) is
   begin
      AUnit.Test_Cases.Registration.Register_Routine
        (T,
         ALS_Diagnostics_On_Typo'Access,
         "Typo produces diagnostics");
   end Register_Tests;

   procedure ALS_Diagnostics_On_Typo
     (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Ada.Characters.Latin_1;
      use Ada.Real_Time;
      use type GNAT.OS_Lib.String_Access;

      Root_Dir  : constant String := "/tmp/lsp_client_als_integration";
      File_Name : constant String := Root_Dir & "/main.adb";

      Baseline_Text : constant String :=
        "procedure Main is" & LF
        & "begin" & LF
        & "   null;" & LF
        & "end Main;" & LF;

      Typo_Text : constant String :=
        "procedure Main is" & LF
        & "begin" & LF
        & "   null" & LF
        & "end Main;" & LF;

      File      : Ada.Text_IO.File_Type;
      Callbacks : aliased ALS_Integration_Callbacks.Integration_Callbacks;

      type Null_Request_Listener is
        new GPS.LSP_Client.Language_Servers.Interceptors.Request_Listener
      with null record;

      Server_Listener  : aliased ALS_Integration_Callbacks.Test_Listener;
      Request_Listener : aliased Null_Request_Listener;

      Config : aliased GPS.LSP_Client.Configurations.ALS.ALS_Configuration
        (Callbacks => Callbacks'Access);

      Server : GPS.LSP_Client.Language_Servers.Language_Server_Access;

      Client : GPS.LSP_Clients.LSP_Client_Access;

      Args : Spawn.String_Vectors.UTF_8_String_Vector :=
        Spawn.String_Vectors.Empty_Vector;

      Open_Params  : LSP.Messages.DidOpenTextDocumentParams;
      Change_Params : LSP.Messages.DidChangeTextDocumentParams;

      Deadline : Ada.Real_Time.Time;
      ALS_Path : GNAT.OS_Lib.String_Access;
   begin
      --  Ensure workspace directory exists
      if not Ada.Directories.Exists (Root_Dir) then
         Ada.Directories.Create_Directory (Root_Dir);
      end if;

      --  Create baseline file on disk
      Ada.Text_IO.Create (File => File, Name => File_Name);
      Ada.Text_IO.Put (File, Baseline_Text);
      Ada.Text_IO.Close (File);

      Callbacks.Project_Root :=
        GNATCOLL.VFS.Create_From_UTF8 (Root_Dir);
      Callbacks.Main_File :=
        GNATCOLL.VFS.Create_From_UTF8 (File_Name);
      Callbacks.Buffer :=
        VSS.Strings.Conversions.To_Virtual_String (Baseline_Text);

      Server_Listener.Ready := False;
      Global_Collector.Has_Diagnostics := False;

      --  Locate ALS binary
      ALS_Path := GNAT.OS_Lib.Locate_Exec_On_Path ("ada_language_server");

      AUnit.Assertions.Assert
        (ALS_Path /= null,
         "ada_language_server executable not found on PATH; "
         & "install it or adjust PATH to run integration tests");

      Config.Server_Program :=
        GNATCOLL.VFS.Create_From_UTF8 (ALS_Path.all);
      Config.Server_Arguments := Args;

      --  Create and initialize server wrapper
      Server :=
        GPS.LSP_Client.Language_Servers.Real.Create
          (Callbacks           => Callbacks'Access,
           Configuration       => Config'Access,
           Server_Interceptor  => Server_Listener'Access,
           Request_Interceptor => Request_Listener'Access,
           Language            => Language.Ada.Ada_Lang);

      Client := Server.Get_Client;

      --  Attach diagnostics collector
      LSP.Clients.Set_Notification_Handler (Client.all, Global_Collector'Access);

      --  Start ALS process
      GPS.LSP_Client.Language_Servers.Real.Start
        (GPS.LSP_Client.Language_Servers.Real.Real_Language_Server'Class
           (Server.all));

      --  Wait for server to become ready
      Deadline := Clock + Milliseconds (5_000);

      loop
         exit when Server_Listener.Ready or else Clock >= Deadline;
         delay 0.05;
      end loop;

      AUnit.Assertions.Assert
        (Server_Listener.Ready,
         "ada_language_server did not become ready within 5 seconds");

      --  Send DidOpen for baseline buffer
      Open_Params :=
        Callbacks.Build_Did_Open_Params (Callbacks.Main_File);
      Client.all.On_DidOpenTextDocument_Notification (Open_Params);

      --  Introduce a typo and send DidChange
      Ada.Text_IO.Create (File => File, Name => File_Name);
      Ada.Text_IO.Put (File, Typo_Text);
      Ada.Text_IO.Close (File);

      declare
         Change : LSP.Messages.TextDocumentContentChangeEvent :=
           (span        => (Is_Set => False),
            rangeLength => (Is_Set => False),
            text        =>
              VSS.Strings.Conversions.To_Virtual_String (Typo_Text));
      begin
         Change_Params.textDocument :=
           (uri     => Open_Params.textDocument.uri,
            version => LSP.Types.LSP_Number (1));
         Change_Params.contentChanges.Append (Change);
      end;

      Client.all.On_DidChangeTextDocument_Notification (Change_Params);

      --  Wait for diagnostics
      Deadline := Clock + Milliseconds (5_000);

      loop
         exit when Global_Collector.Has_Diagnostics or else Clock >= Deadline;
         delay 0.05;
      end loop;

      AUnit.Assertions.Assert
        (Global_Collector.Has_Diagnostics,
         "No diagnostics received after typo change");

      --  Ensure we have at least one diagnostic with a non-empty message
      declare
         use LSP.Messages.Diagnostic_Vectors;
         Diags : constant LSP.Messages.Diagnostic_Vector :=
           Global_Collector.Last_Params.diagnostics;
      begin
         AUnit.Assertions.Assert
           (not Diags.Is_Empty,
            "Diagnostics vector should not be empty");

         declare
            use LSP.Messages.Diagnostic_Vectors.Element_Vectors;
            Raw    : constant LSP.Messages.Diagnostic_Vectors.Element_Vectors
              .Vector :=
                LSP.Messages.Diagnostic_Vectors.Element_Vectors.Vector
                  (Diags);
            First  : constant LSP.Messages.Diagnostic :=
              Element (Raw, First_Index (Raw));
            Message : constant String :=
              VSS.Strings.Conversions.To_UTF_8_String (First.message);
         begin
            AUnit.Assertions.Assert
              (Message'Length > 0,
               "Diagnostic message should not be empty");
         end;
      end;

      --  Stop server (best-effort)
      GPS.LSP_Client.Language_Servers.Real.Shutdown
        (GPS.LSP_Client.Language_Servers.Real.Real_Language_Server'Class
           (Server.all),
         Reject_Immediately => True);
   end ALS_Diagnostics_On_Typo;

end Integration_Tests;
