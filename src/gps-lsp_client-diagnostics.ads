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

--  Minimal diagnostics helper used to log language-server lifecycle events
--  when the LSP_CLIENT_TRACE environment variable is set. When the variable
--  is unset, all calls become no-ops.

package GPS.LSP_Client.Diagnostics is

   procedure Log (Event : String; Detail : String := "");
   --  Append a line to the trace log if diagnostics are enabled. Event is a
   --  short identifier (for example, "start" or "send-request") and Detail
   --  may contain additional context. When tracing is disabled the call
   --  returns immediately.

end GPS.LSP_Client.Diagnostics;
