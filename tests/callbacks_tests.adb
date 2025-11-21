with Ada.Text_IO;

with AUnit.Assertions;
with AUnit.Test_Cases;
with AUnit.Test_Suites;

with GNATCOLL.VFS;

with GPS.LSP_Client.Callbacks;
with GPS.LSP_Client.Utilities;

with LSP.Messages;
with LSP.Types;

with VSS.Strings.Conversions;

package body Callbacks_Tests is

   type Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding function Name (T : Test) return AUnit.Message_String;
   overriding procedure Register_Tests (T : in out Test);

   procedure Null_Callback_Uses_File
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
      return AUnit.Format ("Callback defaults");
   end Name;

   overriding procedure Register_Tests (T : in out Test) is
   begin
      AUnit.Test_Cases.Registration.Register_Routine
        (T,
         Null_Callback_Uses_File'Access,
         "Build_Did_Open_Params forwards host state");
   end Register_Tests;

   procedure Null_Callback_Uses_File
     (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type LSP.Types.LSP_Number;
      use type LSP.Types.Version_Id;

      Path : constant String := "/tmp/demo buffer.ads";
      Handle  : Ada.Text_IO.File_Type;
      Callback : GPS.LSP_Client.Callbacks.Null_Callback;
      File     : constant GNATCOLL.VFS.Virtual_File :=
        GNATCOLL.VFS.Create_From_UTF8 (Path);
      Params   : constant LSP.Messages.DidOpenTextDocumentParams :=
        Callback.Build_Did_Open_Params (File);
      Expected_URI : constant LSP.Messages.DocumentUri :=
        GPS.LSP_Client.Utilities.To_URI (File);
   begin
      Ada.Text_IO.Create (File => Handle, Name => Path);
      Ada.Text_IO.Put_Line (Handle, "-- callback demo");
      Ada.Text_IO.Close (Handle);

      AUnit.Assertions.Assert
        (LSP.Types.To_UTF_8_String (Params.textDocument.uri) =
           LSP.Types.To_UTF_8_String (Expected_URI),
         "callback should use host-provided file path");
      AUnit.Assertions.Assert
        (Params.textDocument.version = LSP.Types.Version_Id (0),
         "default version should start at 0");
      AUnit.Assertions.Assert
        (VSS.Strings.Conversions.To_UTF_8_String
           (Params.textDocument.languageId) = "",
         "languageId should default to empty string");
      AUnit.Assertions.Assert
        (VSS.Strings.Conversions.To_UTF_8_String
           (Params.textDocument.text) = "",
         "text payload should default to empty string");
   end Null_Callback_Uses_File;

end Callbacks_Tests;
