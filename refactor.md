Refactoring Plan: Trim Legacy GNAT Studio Capabilities
======================================================

Context
-------
This library currently mirrors the feature surface GNAT Studio needs, but our
command-line Ada/SPARK editor only embraces a subset of that behavior. The
 items below rank the highest effort-to-payoff refactors, moving from “largest
 win” to “possibly keep depending on future editor ambitions”. For each, we note
 why it is safe to drop, the benefits, and any knock-on tasks.

1. Remove Clangd/C++ Support Stack
----------------------------------
- **Status**: Completed on branch `remove-clangd-stack`.
- **Scope**: Delete `GPS.LSP_Client.Configurations.Clangd` and any GNAT Studio
  preference hooks or Toolchains dependencies that exist purely to feed Clangd.
- **Why**: We only target Ada/SPARK, so bundling megabytes of `.clang-format`
  tuning logic, hook registration, and JSON plumbing offers zero value.
- **Benefit**: Significantly reduces dependencies (GNATCOLL.Traces,
  Default_Preferences, remote execution, Toolchains) and shrinks compilation
  time; simplifies the public configuration API to “ALS-only”.
- **Follow-up**: Verify no remaining references exist in `gps-lsp_client-*.adb`
  files; document that C/C++ LSP servers are unsupported.

2. Replace Interceptors With Optional Diagnostics Logger
--------------------------------------------------------
- **Status**: Completed (`LSP_CLIENT_TRACE` now drives `GPS.LSP_Client.Diagnostics`).
- **Scope**: Drop `GPS.LSP_Client.Language_Servers.Interceptors` and the
  forwarding logic in `GPS.LSP_Client.Language_Servers.Real`, then introduce a
  minimalist diagnostics module that writes key events to a timestamped log when
  an env var (e.g. `LSP_CLIENT_TRACE`) is set.
- **Why**: Interceptors exist so GNAT Studio can spy on every request for GUI
  telemetry. Our editor does not host plug-ins, but we still want an optional
  diagnostics hook while we build out ALS support.
- **Benefit**: Simplifies the hot path between `LSP_Client` and the server,
  reduces dependencies, and gives us a targeted logging tool we can toggle per
  run without carrying the GNAT Studio listener API.
- **Follow-up**: Implement the diagnostics package with lazy env-var detection,
  update `GPS.LSP_Client.Language_Servers.Real` and `GPS.LSP_Clients` to call it
  directly, and document the logging behavior.

3. Drop Partial Result Framework
--------------------------------
- **Status**: Completed in `lsp_client` core; TUI no longer depends on partial
  result callbacks and new clients should treat workspace symbol responses as
  full-result only.
- **Scope**: Remove `GPS.LSP_Client.Partial_Results`, the `$ /progress`
  bookkeeping in `GPS.LSP_Clients`, and the overrides in request packages.
- **Why**: Studio streams large lists into widgets; our CLI can wait for the
  final response, or we can implement streaming piecemeal if a use-case
  appears. Maintaining the token map and JSON rewinding logic adds complexity
  and state that we rarely exercise.
- **Benefit**: Cuts dozens of branches in `gps-lsp_clients.adb`, makes the
  request types smaller, and eases future async refactors.
- **Follow-up**: Decide how to surface `$ /progress` notifications (log and
  drop vs simple callback) before removing the structures.

4. Remove GNATCOLL Scriptable “Shell” Requests
---------------------------------------------
- **Status**: Completed in `lsp_client` core; `GPS.LSP_Client.Requests.Shell`
  has been removed and no TUI code depends on the scripting callbacks.
- **Scope**: Delete `GPS.LSP_Client.Requests.Shell` and the
  `GNATCOLL.Scripts`/`GNATCOLL.Any_Types` callbacks it requires.
- **Why**: This feature bridges ALS commands into GNAT Studio’s scripting
  engine. Our editor handles responses in Ada code and has no script plugins.
- **Benefit**: Sheds heavyweight GNATCOLL packages, shortens build times, and
  prevents script-specific semantics from leaking into a CLI editor.
- **Follow-up**: Ensure nothing else depends on `Abstract_Shell_Request`; add
  documentation pointing users to native editor hooks instead.

5. Trim GNAT Studio Execute Command Helpers
-------------------------------------------
- **Scope**: Remove specialized executeCommand wrappers such as
  `Reload_Project`, `Show_Dependencies`, and `Shell` invocations.
- **Why**: These correspond to Studio-only workflows (project reloading,
  dependency pane refresh, GNATdoc integration). We can keep the generic
  executeCommand request and re-implement anything the CLI truly needs later.
- **Benefit**: Reduces the requests surface to Ada-focused essentials and
  avoids carrying protocol baggage for features we will never expose.
- **Follow-up**: Update tests to cover only the retained requests; document
  that new commands should be implemented inside the editor, not the library.

6. Optional: Simplify Spawn/Environment Abstractions
----------------------------------------------------
- **Scope**: Revisit `GPS.LSP_Client.Callbacks` and `LSP_Client.Start` to see
  whether we truly need the full `Spawn` environment indirection, restart
  timers, and log file plumbing.
- **Why**: If the editor embeds its own process supervisor or uses a different
  async runtime, we may prefer a slimmer abstraction that simply launches ALS
  and returns pipes to the caller.
- **Benefit**: Lower coupling to GNATCOLL.Spawn, clearer model for integrating
  with an external event loop, and easier unit testing.
- **Follow-up**: Prototype the editor’s process lifecycle first; if we still
  lean on Spawn, document the integration requirements instead of removing it.

Review cadence
--------------
Treat this plan as a living checklist. Once we remove a capability, capture
the delta in `PLAN.md` or release notes so downstream users understand the new
contract. For any optional item, revisit after the core editor architecture is
stable to avoid preemptively deleting something we might need.***
