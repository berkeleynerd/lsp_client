with GNATCOLL.VFS;

with GPS.LSP_Client.Callbacks;
with GPS.LSP_Client.Language_Servers;

with LSP.Client_Notification_Receivers;
with LSP.Messages;
with LSP.Types;

with VSS.Strings;

package ALS_Integration_Callbacks is

   type Integration_Callbacks is
     new GPS.LSP_Client.Callbacks.Null_Callback with record
      Project_Root : GNATCOLL.VFS.Virtual_File := GNATCOLL.VFS.No_File;
      Main_File    : GNATCOLL.VFS.Virtual_File := GNATCOLL.VFS.No_File;
      Buffer       : VSS.Strings.Virtual_String :=
        VSS.Strings.Empty_Virtual_String;
   end record;

   overriding function Get_Project_Path
     (Self : Integration_Callbacks)
      return GNATCOLL.VFS.Virtual_File;

   overriding function Get_Project_File
     (Self : Integration_Callbacks)
      return GNATCOLL.VFS.Virtual_File;

   overriding function Build_Did_Open_Params
     (Self : Integration_Callbacks;
      File : GNATCOLL.VFS.Virtual_File)
      return LSP.Messages.DidOpenTextDocumentParams;

   type Diagnostics_Collector is
     new LSP.Client_Notification_Receivers.Client_Notification_Receiver
   with record
      Has_Diagnostics : Boolean := False;
      Last_Params     : LSP.Messages.PublishDiagnosticsParams;
   end record;

   overriding procedure On_Show_Message
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.ShowMessageParams);

   overriding procedure On_Log_Message
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.LogMessageParams);

   overriding procedure On_Publish_Diagnostics
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.PublishDiagnosticsParams);

   overriding function Get_Progress_Type
     (Self  : access Diagnostics_Collector;
      Token : LSP.Types.LSP_Number_Or_String)
      return LSP.Client_Notification_Receivers.Progress_Value_Kind;

   overriding procedure On_Progress
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.Progress_Params);

   overriding procedure On_Progress_SymbolInformation_Vector
     (Self   : access Diagnostics_Collector;
      Params : LSP.Messages.Progress_SymbolInformation_Vector);

end ALS_Integration_Callbacks;
