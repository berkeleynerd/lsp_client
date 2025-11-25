------------------------------------------------------------------------------
--                               GNAT Studio                                --
--                                                                          --
--                       Copyright (C) 2024, AdaCore                        --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General  Public  License  distributed  with  this  software;   see  file --
-- COPYING3.  If not, go to http://www.gnu.org/licenses for a complete copy --
-- of the license.                                                          --
------------------------------------------------------------------------------

with Ada.Calendar;
with Ada.Characters.Handling;
with Ada.Directories;
with Ada.Strings.Fixed;
with Ada.Text_IO;

with GNAT.OS_Lib;

package body GPS.LSP_Client.Diagnostics is
   use type GNAT.OS_Lib.String_Access;

   use Ada.Calendar;

   package TIO renames Ada.Text_IO;

   Initialized : Boolean := False;
   Enabled     : Boolean := False;
   Log_File    : TIO.File_Type;

   -------------------
   -- Ensure_Logger --
   -------------------

   procedure Ensure_Logger;
   --  Make sure the environment is inspected and, if enabled, the log file is
   --  opened.

   function File_Timestamp return String;
   function Line_Timestamp return String;
   --  Format timestamps for log file names and log entries respectively.

   function Pad (Value : Natural; Width : Positive) return String;
   --  Return Value zero-padded to Width digits.

   function Has_Trailing_Separator (Value : String) return Boolean;
   --  Whether Value ends with '/' or '\'. Used to detect explicit directories.

   procedure Timestamp_Helper
     (Year   : out Year_Number;
      Month  : out Month_Number;
      Day    : out Day_Number;
      Hour   : out Natural;
      Minute : out Natural;
      Second : out Natural);
   --  Split the current time into calendar/date components.

   -------------------
   -- Build_Log_Path --
   -------------------

   function Build_Log_Path (Value : String) return String;
   --  Interpret the raw environment value. When it denotes a directory (or
   --  ends with a directory separator) create the directory if necessary and
   --  return a timestamped file underneath it. When it denotes a file path,
   --  ensure its parent directory exists and return the file path as-is.
   --  Returns the empty string if no usable path can be formed.

   ------------------------
   -- Ensure_Containing --
   ------------------------

   procedure Ensure_Containing (Path : String);
   --  Create parent directories for Path when needed.

   -------------------
   -- Ensure_Logger --
   -------------------

   procedure Ensure_Logger is
      use Ada.Characters.Handling;
      use Ada.Strings.Fixed;

      Env_Value : GNAT.OS_Lib.String_Access :=
        GNAT.OS_Lib.Getenv ("LSP_CLIENT_TRACE");
   begin
      if Initialized then
         return;
      end if;

      Initialized := True;

      if Env_Value = null then
         return;
      end if;

      declare
         Value : constant String :=
           Trim (Env_Value.all, Ada.Strings.Both);
      begin
         GNAT.OS_Lib.Free (Env_Value);

         if Value'Length = 0 then
            return;
         end if;

         declare
            Lower : constant String := To_Lower (Value);
            Path  : constant String :=
              (if Lower = "1" or else Lower = "true"
               then Build_Log_Path ("./")
               else Build_Log_Path (Value));
         begin
            if Path'Length = 0 then
               return;
            end if;

            begin
               TIO.Open (Log_File, TIO.Append_File, Path);
            exception
               when others =>
                  TIO.Create (Log_File, TIO.Out_File, Path);
            end;

            Enabled := True;
            TIO.Put_Line
              (Log_File,
               Line_Timestamp
               & " [diagnostics] logging enabled at " & Path);
            TIO.Flush (Log_File);
         end;
      end;
   end Ensure_Logger;

   ------------------------
   -- Ensure_Containing --
   ------------------------

   procedure Ensure_Containing (Path : String) is
      use Ada.Directories;

      Dir : constant String := Containing_Directory (Path);
   begin
      if Dir'Length = 0 then
         return;
      end if;

      if not Exists (Dir) then
         Create_Path (Dir);
      end if;
   end Ensure_Containing;

   -------------------
   -- Build_Log_Path --
   -------------------

   function Build_Log_Path (Value : String) return String is
      use Ada.Directories;
      use Ada.Strings.Fixed;

      Clean : constant String := Trim (Value, Ada.Strings.Both);
      File_Name : constant String :=
        "lsp_client-" & File_Timestamp & ".log";
   begin
      if Clean'Length = 0 then
         return "";
      end if;

      declare
         Trailing_Slash : constant Boolean :=
           Has_Trailing_Separator (Clean);
         Is_Directory : constant Boolean :=
           Trailing_Slash
             or else (Exists (Clean)
                      and then Kind (Clean) = Directory);
         Target_Dir : constant String :=
           (if Is_Directory
            then (if Trailing_Slash and then Clean'Length > 1
                  then Clean (Clean'First .. Clean'Last - 1)
                  else Clean)
            else "");
      begin
         if Is_Directory then
            declare
               Dir_Path : constant String :=
                 (if Target_Dir'Length = 0 then "." else Target_Dir);
            begin
               if not Exists (Dir_Path) then
                  Create_Path (Dir_Path);
               end if;

               return Compose (Dir_Path, File_Name);
            end;
         else
            Ensure_Containing (Clean);
            return Clean;
         end if;
      end;
   exception
      when others =>
         return "";
   end Build_Log_Path;

   ------------------------
   -- Has_Trailing_Separator --
   ------------------------

   function Has_Trailing_Separator (Value : String) return Boolean is
   begin
      if Value'Length = 0 then
         return False;
      end if;

      declare
         Last : constant Character := Value (Value'Last);
      begin
         return Last = '/' or else Last = '\';
      end;
   end Has_Trailing_Separator;

   --------------
   -- Pad      --
   --------------

   function Pad (Value : Natural; Width : Positive) return String is
      use Ada.Strings.Fixed;

      Img : constant String := Trim (Natural'Image (Value), Ada.Strings.Both);
   begin
      if Img'Length >= Width then
         return Img;
      else
         return (1 .. Width - Img'Length => '0') & Img;
      end if;
   end Pad;

   ----------------------
   -- Timestamp_Helper --
   ----------------------

   procedure Timestamp_Helper
     (Year   : out Year_Number;
      Month  : out Month_Number;
      Day    : out Day_Number;
      Hour   : out Natural;
      Minute : out Natural;
      Second : out Natural) is
      Seconds : Day_Duration;
      Total   : Integer;
   begin
      Split (Clock, Year, Month, Day, Seconds);
      Total := Integer (Seconds);
      Hour := Total / 3_600;
      Minute := (Total mod 3_600) / 60;
      Second := Total mod 60;
   end Timestamp_Helper;

   -------------------
   -- File_Timestamp --
   -------------------

   function File_Timestamp return String is
      Year   : Year_Number;
      Month  : Month_Number;
      Day    : Day_Number;
      Hour   : Natural;
      Minute : Natural;
      Second : Natural;
   begin
      Timestamp_Helper (Year, Month, Day, Hour, Minute, Second);

      return
        Pad (Natural (Year), 4)
        & Pad (Natural (Month), 2)
        & Pad (Natural (Day), 2)
        & "-" & Pad (Hour, 2)
        & Pad (Minute, 2)
        & Pad (Second, 2);
   end File_Timestamp;

   -------------------
   -- Line_Timestamp --
   -------------------

   function Line_Timestamp return String is
      Year   : Year_Number;
      Month  : Month_Number;
      Day    : Day_Number;
      Hour   : Natural;
      Minute : Natural;
      Second : Natural;
   begin
      Timestamp_Helper (Year, Month, Day, Hour, Minute, Second);

      return
        Pad (Natural (Year), 4) & "-"
        & Pad (Natural (Month), 2) & "-"
        & Pad (Natural (Day), 2) & " "
        & Pad (Hour, 2) & ":"
        & Pad (Minute, 2) & ":"
        & Pad (Second, 2);
   end Line_Timestamp;

   ---------
   -- Log --
   ---------

   procedure Log (Event : String; Detail : String := "") is
   begin
      if not Initialized then
         Ensure_Logger;
      end if;

      if not Enabled then
         return;
      end if;

      declare
         Line : constant String :=
           Line_Timestamp
           & " [" & Event & "]"
           & (if Detail'Length = 0 then "" else " " & Detail);
      begin
         begin
            TIO.Put_Line (Log_File, Line);
            TIO.Flush (Log_File);
         exception
            when others =>
               null;
         end;
      end;
   end Log;

end GPS.LSP_Client.Diagnostics;
