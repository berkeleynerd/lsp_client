lsp_client (draft crate)

Purpose
- Headless LSP client core for GNAT Studio. Protocol-only: request/response
  marshaling, text document sync, server lifecycle — no UI or kernel deps.

Status
- Draft manifest for split. In this monorepo the alire manifest references
  ../../lsp_client.gpr. In a standalone repo, place lsp_client.gpr
  at the repo root and set project-files accordingly.

Dependencies
- language, shared, ada_language_server
- vss and spawn are pulled transitively via the ALS/tooling stack.

Build (monorepo)
- cd crates/lsp_client && alr build
  (Pins point to sibling gps_* crates)

Runtime note
- This is a library crate. Applications using it should ensure the
  ada_language_server binary is available on PATH when launching an LSP
  server process.
- Process spawning is asynchronous: the library does not call
  Spawn.Processes.Monitor_Loop itself. Hosts must integrate
  Monitor_Loop (or an equivalent driver) into their event loop so that
  child processes are actually started and their I/O and lifecycle
  events are delivered.

Diagnostics
- Set the `LSP_CLIENT_TRACE` environment variable to capture detailed client
  traces. When the value is `1`/`true` the library writes
  `lsp_client-YYYYMMDD-HHMMSS.log` into the current directory; when the value is
  a directory or file path, logs are written there instead. Leaving the variable
  unset keeps tracing disabled with zero overhead.
