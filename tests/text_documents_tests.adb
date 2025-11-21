with Ada.Characters.Latin_1;
with Ada.Text_IO;

with AUnit.Assertions;
with AUnit.Test_Cases;
with AUnit.Test_Suites;

with GNATCOLL.VFS;

with GPS.LSP_Client.Text_Documents;
with GPS.LSP_Client.Utilities;

with LSP.Messages;
with LSP.Types;

with VSS.Strings;
with VSS.Strings.Conversions;

package body Text_Documents_Tests is

   type Dummy_Handler is
     new GPS.LSP_Client.Text_Documents.Text_Document_Handler with record
      File    : GNATCOLL.VFS.Virtual_File;
      Version : LSP.Types.LSP_Number := 0;
      Text    : VSS.Strings.Virtual_String;
   end record;

   overriding function Get_Did_Change_Message
     (Self : in out Dummy_Handler;
      Mode : GPS.LSP_Client.Text_Documents.Text_Document_Sync_Kind_Type)
      return LSP.Messages.DidChangeTextDocumentParams;

   overriding function File
     (Self : Dummy_Handler) return GNATCOLL.VFS.Virtual_File;

   procedure Set_Text
     (Self  : in out Dummy_Handler;
      Value : String) is
   begin
      Self.Text := VSS.Strings.Conversions.To_Virtual_String (Value);
   end Set_Text;

   type Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding function Name (T : Test) return AUnit.Message_String;
   overriding procedure Register_Tests (T : in out Test);

   procedure Full_Text_Roundtrip
     (T : in out AUnit.Test_Cases.Test_Case'Class);

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      Ret : constant AUnit.Test_Suites.Access_Test_Suite :=
        AUnit.Test_Suites.New_Suite;
   begin
      AUnit.Test_Suites.Add_Test (Ret, new Test);
      return Ret;
   end Suite;

   overriding function Get_Did_Change_Message
     (Self : in out Dummy_Handler;
      Mode : GPS.LSP_Client.Text_Documents.Text_Document_Sync_Kind_Type)
      return LSP.Messages.DidChangeTextDocumentParams
   is
      use type LSP.Types.LSP_Number;
      pragma Unreferenced (Mode);
      Change : LSP.Messages.TextDocumentContentChangeEvent;
      Result : LSP.Messages.DidChangeTextDocumentParams;
   begin
      Self.Version := Self.Version + 1;

      Change :=
        (span        => (Is_Set => False),
         rangeLength => (Is_Set => False),
         text        => Self.Text);

      Result.textDocument :=
        (uri     => GPS.LSP_Client.Utilities.To_URI (Self.File),
         version => Self.Version);
      Result.contentChanges.Append (Change);

      return Result;
   end Get_Did_Change_Message;

   overriding function File
     (Self : Dummy_Handler) return GNATCOLL.VFS.Virtual_File is
   begin
      return Self.File;
   end File;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Text document full-sync roundtrip");
   end Name;

   overriding procedure Register_Tests (T : in out Test) is
   begin
      AUnit.Test_Cases.Registration.Register_Routine
        (T,
         Full_Text_Roundtrip'Access,
         "Full sync increments version and carries payload");
   end Register_Tests;

   procedure Full_Text_Roundtrip
     (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use GPS.LSP_Client.Text_Documents;
      use LSP.Messages.TextDocumentContentChangeEvent_Vectors;
      use type LSP.Types.LSP_Number;
      Path : constant String :=
        "/tmp/full_sync example.adb";
      File_Handle : Ada.Text_IO.File_Type;

      Handler : Dummy_Handler :=
        (File    => GNATCOLL.VFS.Create_From_UTF8 (Path),
         Version => 0,
         Text    => VSS.Strings.Conversions.To_Virtual_String
           ("first line" & Ada.Characters.Latin_1.LF & "second line"));

      First  : LSP.Messages.DidChangeTextDocumentParams;
      Second : LSP.Messages.DidChangeTextDocumentParams;

      function Payload
        (Message : LSP.Messages.DidChangeTextDocumentParams) return String;

      function Payload
        (Message : LSP.Messages.DidChangeTextDocumentParams) return String is
         use LSP.Messages.TextDocumentContentChangeEvent_Vectors.Element_Vectors;
         Raw    : constant LSP.Messages.TextDocumentContentChangeEvent_Vectors
           .Element_Vectors.Vector :=
             LSP.Messages.TextDocumentContentChangeEvent_Vectors
               .Element_Vectors.Vector (Message.contentChanges);
         Change : constant LSP.Messages.TextDocumentContentChangeEvent :=
           Element (Raw, First_Index (Raw));
      begin
         AUnit.Assertions.Assert
           (not Change.span.Is_Set,
            "full text sync should omit span");
         AUnit.Assertions.Assert
           (not Change.rangeLength.Is_Set,
            "full text sync should omit range length");

         return VSS.Strings.Conversions.To_UTF_8_String (Change.text);
      end Payload;
   begin
      Ada.Text_IO.Create (File => File_Handle, Name => Path);
      Ada.Text_IO.Put_Line (File_Handle, "-- buffer");
      Ada.Text_IO.Close (File_Handle);

      First := Handler.Get_Did_Change_Message (Full);

      AUnit.Assertions.Assert
        (First.textDocument.version = 1,
         "first change should start at version 1");
      AUnit.Assertions.Assert
        (LSP.Types.To_UTF_8_String (First.textDocument.uri) =
           LSP.Types.To_UTF_8_String
             (GPS.LSP_Client.Utilities.To_URI (Handler.File)),
         "change should target handler file");
      AUnit.Assertions.Assert
        (not First.contentChanges.Is_Empty,
         "full sync should produce one content change");
      AUnit.Assertions.Assert
        (Payload (First) =
           "first line" & Ada.Characters.Latin_1.LF & "second line",
         "payload should contain initial buffer text");

      Handler.Set_Text ("revised text payload");
      Second := Handler.Get_Did_Change_Message (Full);

      AUnit.Assertions.Assert
        (Second.textDocument.version = 2,
         "second change should bump version");
      AUnit.Assertions.Assert
        (Payload (Second) = "revised text payload",
         "payload should use latest buffer text");
   end Full_Text_Roundtrip;

end Text_Documents_Tests;
