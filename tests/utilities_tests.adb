with Ada.Directories;
with Ada.Strings.Fixed;
with Ada.Text_IO;

with AUnit.Assertions;
with AUnit.Test_Cases;
with AUnit.Test_Suites;

with GNATCOLL.VFS;

with GPS.LSP_Client.Utilities;

with LSP.Messages;
with LSP.Types;

package body Utilities_Tests is

   Base_Dir : constant String := "/tmp/lsp_client_tests";

   procedure Ensure_Base_Dir;

   function Create_File (Name : String) return GNATCOLL.VFS.Virtual_File;

   function Normalized
     (File : GNATCOLL.VFS.Virtual_File) return String;

   type Test is new AUnit.Test_Cases.Test_Case with null record;

   overriding function Name (T : Test) return AUnit.Message_String;
   overriding procedure Register_Tests (T : in out Test);

   procedure Roundtrip
     (T                    : in out AUnit.Test_Cases.Test_Case'Class;
      File                 : GNATCOLL.VFS.Virtual_File;
      Expect_Encoded_Space : Boolean := False;
      Expect_Segment       : String := "");

   procedure Paths_With_Spaces
     (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Relative_Path
     (T : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Case_Preservation
     (T : in out AUnit.Test_Cases.Test_Case'Class);

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
      Ret : constant AUnit.Test_Suites.Access_Test_Suite :=
        AUnit.Test_Suites.New_Suite;
   begin
      AUnit.Test_Suites.Add_Test (Ret, new Test);
      return Ret;
   end Suite;

   procedure Ensure_Base_Dir is
   begin
      if not Ada.Directories.Exists (Base_Dir) then
         Ada.Directories.Create_Directory (Base_Dir);
      end if;
   end Ensure_Base_Dir;

   function Create_File (Name : String) return GNATCOLL.VFS.Virtual_File is
      Path : constant String := Base_Dir & "/" & Name;
      File : Ada.Text_IO.File_Type;
   begin
      Ensure_Base_Dir;
      Ada.Text_IO.Create (File => File, Name => Path);
      Ada.Text_IO.Put_Line (File, "-- test file");
      Ada.Text_IO.Close (File);
      return GNATCOLL.VFS.Create_From_UTF8 (Path);
   end Create_File;

   function Normalized
     (File : GNATCOLL.VFS.Virtual_File) return String is
      Value : constant GNATCOLL.VFS.Cst_Filesystem_String_Access :=
        GNATCOLL.VFS.Full_Name
          (File, Normalize => True, Resolve_Links => True);
   begin
      return String (Value.all);
   end Normalized;

   overriding function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Utilities conversions");
   end Name;

   overriding procedure Register_Tests (T : in out Test) is
   begin
      AUnit.Test_Cases.Registration.Register_Routine
        (T,
         Paths_With_Spaces'Access,
         "File URI roundtrip preserves spaces");

      AUnit.Test_Cases.Registration.Register_Routine
        (T,
         Relative_Path'Access,
         "Roundtrip normalizes relative paths");

      AUnit.Test_Cases.Registration.Register_Routine
        (T,
         Case_Preservation'Access,
         "Roundtrip keeps path casing");
   end Register_Tests;

   procedure Roundtrip
     (T                    : in out AUnit.Test_Cases.Test_Case'Class;
      File                 : GNATCOLL.VFS.Virtual_File;
      Expect_Encoded_Space : Boolean := False;
      Expect_Segment       : String := "")
   is
      pragma Unreferenced (T);
      Expected : constant String := Normalized (File);
      Uri      : constant LSP.Messages.DocumentUri :=
        GPS.LSP_Client.Utilities.To_URI (File);
      Back     : constant GNATCOLL.VFS.Virtual_File :=
        GPS.LSP_Client.Utilities.To_Virtual_File (Uri);
      Actual   : constant String := Normalized (Back);
      Uri_Text : constant String := LSP.Types.To_UTF_8_String (Uri);
      Message  : constant String :=
        "roundtrip mismatch for " & Expected
        & " uri=" & Uri_Text
        & " expected=" & Expected
        & " actual=" & Actual;
   begin
      AUnit.Assertions.Assert (Actual = Expected, Message);

      if Expect_Encoded_Space then
         AUnit.Assertions.Assert
           (Ada.Strings.Fixed.Index (Uri_Text, "%20") /= 0,
            "URI should percent-encode spaces: " & Uri_Text);
      end if;

      if Expect_Segment'Length > 0 then
         AUnit.Assertions.Assert
           (Ada.Strings.Fixed.Index (Uri_Text, Expect_Segment) /= 0,
            "URI should preserve segment " & Expect_Segment
            & ": " & Uri_Text);
      end if;

      AUnit.Assertions.Assert
        (Uri_Text'Length > 0, "URI should not be empty");
   end Roundtrip;

   procedure Paths_With_Spaces
     (T : in out AUnit.Test_Cases.Test_Case'Class) is
      File : constant GNATCOLL.VFS.Virtual_File :=
        Create_File ("demo buffer.adb");
   begin
      Roundtrip
        (T,
         File,
         Expect_Encoded_Space => True,
         Expect_Segment       => "demo%20buffer.adb");
   end Paths_With_Spaces;

   procedure Relative_Path
     (T : in out AUnit.Test_Cases.Test_Case'Class) is
      Prev : constant String := Ada.Directories.Current_Directory;
      File : GNATCOLL.VFS.Virtual_File;
   begin
      File := Create_File ("relative_file.adb");
      Ada.Directories.Set_Directory (Base_Dir);

      declare
         Rel_File : constant GNATCOLL.VFS.Virtual_File :=
           GNATCOLL.VFS.Create_From_UTF8 ("./relative_file.adb");
         Abs_File : constant GNATCOLL.VFS.Virtual_File :=
           GNATCOLL.VFS.Create_From_UTF8 (Normalized (Rel_File));
      begin
         Roundtrip (T, Abs_File);
         AUnit.Assertions.Assert
           (GNATCOLL.VFS.Is_Absolute_Path (Abs_File),
            "relative path should normalize to absolute: "
            & Normalized (Rel_File));
         AUnit.Assertions.Assert
           (Normalized (Rel_File) = Normalized (Abs_File),
            "normalized relative path should match absolute target");
      exception
         when others =>
            Ada.Directories.Set_Directory (Prev);
            raise;
      end;

      Ada.Directories.Set_Directory (Prev);
      pragma Unreferenced (File);
   end Relative_Path;

   procedure Case_Preservation
     (T : in out AUnit.Test_Cases.Test_Case'Class) is
      File : constant GNATCOLL.VFS.Virtual_File := Create_File ("FiLe.AdB");
   begin
      Roundtrip
        (T,
         File,
         Expect_Segment => "FiLe.AdB");
   end Case_Preservation;

end Utilities_Tests;
