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

## macOS toolchain fix

macOS users must run `./fix_toolchain.sh` (present in this directory) whenever
the GNAT toolchain is freshly installed via `alr`. It wipes the bundled
`include-fixed` headers and updates the SDK symlink so GNAT can compile the C
sources that ship with dependencies such as `gnatcoll` and `ncursesada`.
Skip this step on non-macOS hosts.

## Fedora Asahi Remix (aarch64) prerequisites

On Fedora Asahi Remix 43 (Workstation Edition, aarch64), building this crate
and its dependencies via Alire requires that the system C toolchain and GMP
development headers be installed. Before running `alr build` or `alr install`
for `lsp_client` (or any sibling crate in this monorepo), install:

```bash
sudo dnf install gcc glibc-devel glibc-headers gmp-devel ncurses-devel ncurses-compat-libs
```

- `gcc`, `glibc-devel`, and `glibc-headers` provide the standard C headers
  (such as `<string.h>`) that `libgpr` and other C components depend on.
- `gmp-devel` provides `gmp.h` and the `gmp.pc` file so `gnatcoll_gmp` and
  `libgmp` are found correctly via `pkg-config`; without it, builds will fail
  with `fatal error: gmp.h: No such file or directory`.
- `ncurses-devel` and `ncurses-compat-libs` are only required by the TUI
  application crate, but installing them once allows end-to-end builds of the
  GNAT Studio workspace on this platform.
