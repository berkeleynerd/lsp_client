with GPS.LSP_Client.Utilities;

with VSS.Strings.Conversions;

package body ALS_Integration_Callbacks is

   overriding function Get_Project_Path
     (Self : Integration_Callbacks)
      return GNATCOLL.VFS.Virtual_File is
   begin
      return Self.Project_Root;
   end Get_Project_Path;

   overriding function Get_Project_File
     (Self : Integration_Callbacks)
      return GNATCOLL.VFS.Virtual_File is
      pragma Unreferenced (Self);
   begin
      return GNATCOLL.VFS.No_File;
   end Get_Project_File;

   overriding function Build_Did_Open_Params
     (Self : Integration_Callbacks;
      File : GNATCOLL.VFS.Virtual_File)
      return LSP.Messages.DidOpenTextDocumentParams
   is
      URI : constant LSP.Messages.DocumentUri :=
        GPS.LSP_Client.Utilities.To_URI (File);
   begin
      return
        (textDocument =>
           (uri        => URI,
            languageId =>
              VSS.Strings.Conversions.To_Virtual_String ("ada"),
            version    => LSP.Types.Version_Id (0),
            text       => Self.Buffer));
   end Build_Did_Open_Params;

   overriding procedure On_Show_Message
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.ShowMessageParams)
   is
      pragma Unreferenced (Self, Params);
   begin
      null;
   end On_Show_Message;

   overriding procedure On_Log_Message
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.LogMessageParams)
   is
      pragma Unreferenced (Self, Params);
   begin
      null;
   end On_Log_Message;

   overriding procedure On_Publish_Diagnostics
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.PublishDiagnosticsParams) is
   begin
      Self.Has_Diagnostics := True;
      Self.Last_Params     := Params;
   end On_Publish_Diagnostics;

   overriding function Get_Progress_Type
     (Self  : access Diagnostics_Collector;
      Token : LSP.Types.LSP_Number_Or_String)
      return LSP.Client_Notification_Receivers.Progress_Value_Kind
   is
      pragma Unreferenced (Self, Token);
   begin
      return LSP.Client_Notification_Receivers.ProgressParams;
   end Get_Progress_Type;

   overriding procedure On_Progress
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.Progress_Params)
   is
      pragma Unreferenced (Self, Params);
   begin
      null;
   end On_Progress;

   overriding procedure On_Progress_SymbolInformation_Vector
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.Progress_SymbolInformation_Vector)
   is
      pragma Unreferenced (Self, Params);
   begin
      null;
   end On_Progress_SymbolInformation_Vector;

end ALS_Integration_Callbacks;
