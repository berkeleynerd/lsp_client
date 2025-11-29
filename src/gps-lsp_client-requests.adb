------------------------------------------------------------------------------
--                               GNAT Studio                                --
--                                                                          --
--                       Copyright (C) 2019-2023, AdaCore                   --
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

with Ada.Unchecked_Deallocation;

with GPS.LSP_Client.Language_Servers;
with GNATCOLL.Traces; use GNATCOLL.Traces;

package body GPS.LSP_Client.Requests is

   Me_Debug : constant Trace_Handle :=
     Create ("GPS.LSP_CLIENT.REQUESTS.DEBUG", Off);

   ------------
   -- Adjust --
   ------------

   overriding procedure Adjust (Self : in out Abstract_Reference) is
   begin
      if Self.Request /= null then
         Self.Request.References.Append (Self'Unchecked_Access);
         Self.Position := Self.Request.References.Last;
      end if;
   end Adjust;

   ------------
   -- Cancel --
   ------------

   procedure Cancel (Self : in out Reference) is
   begin
      if Self.Request /= null then
         if Self.Server /= null then
            Self.Server.Cancel (Self.Request);

         else
            Self.Request.On_Rejected (Canceled);
            Destroy (Self.Request);
         end if;
      end if;
   end Cancel;

   --------
   -- Id --
   --------

   function Id (Self : LSP_Request) return LSP.Types.LSP_Number_Or_String is
   begin
      return Self.Id;
   end Id;

   ------------
   -- Set_Id --
   ------------

   procedure Set_Id
     (Self : in out LSP_Request;
      Id   : LSP.Types.LSP_Number_Or_String) is
   begin
      Self.Id := Id;
   end Set_Id;

   -------------
   -- Destroy --
   -------------

   procedure Destroy
     (Item         : in out Request_Access;
      Is_Cancelled : Boolean := False)
   is
      procedure Free is
        new Ada.Unchecked_Deallocation (LSP_Request'Class, Request_Access);

   begin
      if Is_Cancelled then
         Trace (Me_Debug, "Canceling: " & Item'Image);
      else
         Trace (Me_Debug, "Destroying: " & Item'Image);
      end if;
      if Item /= null then
         for Reference of Item.References loop
            Reference.Request := null;
            Reference.Server  := null;
            Reference.Position := Reference_Lists.No_Element;
         end loop;

         Item.References.Clear;
         Item.Finalize;
         Free (Item);
      end if;
      Item := null;
   end Destroy;

   --  Execute helpers that routed requests through Language objects and a
   --  multi-language server registry were removed in this Ada/SPARK-only
   --  variant. Callers are expected to enqueue requests via their owning
   --  LSP client/server instances directly.

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (Self : in out Abstract_Reference) is
   begin
      if Self.Request /= null then
         Self.Request.References.Delete (Self.Position);
         Self.Request := null;
         Self.Server  := null;
      end if;
   end Finalize;

   -----------------
   -- Has_Request --
   -----------------

   function Has_Request (Self : Reference) return Boolean is
   begin
      return Self.Request /= null;
   end Has_Request;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize
     (Self    : in out Abstract_Reference'Class;
      Request : Request_Access;
      Server  : GPS.LSP_Client.Language_Servers.Language_Server_Access) is
   begin
      Self.Request := Request;
      Self.Server  := Language_Server_Access (Server);

      if Self.Request /= null then
         Self.Request.References.Append (Self'Unchecked_Access);
         Self.Position := Self.Request.References.Last;
      end if;
   end Initialize;

   -------------
   -- Request --
   -------------

   function Request (Self : Reference) return Request_Access is
   begin
      return Self.Request;
   end Request;

   -------------------
   -- Text_Document --
   -------------------

   function Text_Document
     (Self : LSP_Request) return GNATCOLL.VFS.Virtual_File is
   begin
      return GNATCOLL.VFS.No_File;
   end Text_Document;

end GPS.LSP_Client.Requests;
