# ALS Integration & LSP Client Validation Plan

This file captures the current status and next steps for validating the
`lsp_client` Ada library against `ada_language_server` (ALS), using both
protocol-level and end-to-end integration tests.

The goal is to make it easy to resume this work later with all relevant
context in one place.

---

## Current Status

- **Protocol-only tests**
  - Project: `tests/tests.gpr`
  - Executable: `tests`
  - Command: `alr run tests`
  - These tests cover:
    - `GPS.LSP_Client.Utilities` conversions:
      - `Virtual_File` ↔ `DocumentUri` round-trips (spaces, relative/absolute, case).
    - `GPS.LSP_Client.Text_Documents`:
      - Full-text `Get_Did_Change_Message` behavior (version increments, payload).
      - `GPS.LSP_Client.Callbacks.Null_Callback`:
      - `Build_Did_Open_Params` wiring (uri, languageId, version, text).
  - Status: **Green** in this workspace.

- **Partial result framework**
  - `GPS.LSP_Client.Partial_Results` and `$ /progress` bookkeeping have been
    removed from the client core; requests such as workspace symbols now expose
    full-result responses only.
  - Status: **Completed** in this library; downstream editors should no longer
    rely on partial result callbacks when integrating `lsp_client`.

- **Shell requests (GNATCOLL.Scripts bridge)**
  - `GPS.LSP_Client.Requests.Shell` has been deleted from the core library and
    is no longer part of the public API. Scriptable ALS commands should be
    implemented directly in the editor front end instead of via `GNATCOLL.Scripts`.
  - Status: **Completed**; TUI builds cleanly against the updated library.

- **ALS integration tests**
  - Project: `tests/integration_tests.gpr`
  - Executable: `integration_tests_main`
  - Command: `alr run integration_tests_main`
  - Test: `Integration_Tests.ALS_Diagnostics_On_Typo`:
    - Creates `/tmp/lsp_client_als_integration/main.adb` with a valid Ada `Main`.
    - Builds a `Integration_Callbacks` object and an `ALS_Configuration`.
    - Uses `GPS.LSP_Client.Language_Servers.Real.Create` + `Start` to launch ALS via:
      - `Executable` = result of `Locate_Exec_On_Path ("ada_language_server")`.
      - `Server_Program` = that path wrapped as `Virtual_File`.
      - `Server_Arguments` = empty vector (no args yet).
    - Retrieves the underlying `LSP_Client` via `Server.Get_Client`.
    - Installs a `Diagnostics_Collector` as notification handler via
      `LSP.Clients.Set_Notification_Handler`.
    - Waits up to 5 seconds for `GPS.LSP_Clients.Is_Ready` to report True
      (polling while driving `Spawn.Processes.Monitor_Loop`).
    - On success would:
      - Send `didOpen` with baseline text.
      - Rewrite `main.adb` with a typo.
      - Send `didChange` with full document text.
      - Wait for `textDocument/publishDiagnostics` and assert diagnostics.
  - Status: **Failing**:
    - Fails at the readiness assertion:
      - `ada_language_server did not become ready within 5 seconds`.
    - This indicates:
      - ALS is invoked successfully (path resolution and process spawn work).
      - But the ALS client library (`GPS.LSP_Clients`) never sees a valid
        `initialize` response that triggers `Response_Handler.Initialize_Response`
        and thus flips `Is_Ready` within the timeout.

- **ALS binary**
  - Source: installed by Alire at
    `~/.local/share/alire/releases/ada_language_server_25.0.0_72b68d6b`.
  - Built with:
    - `alr exec -- gprbuild -p -P ~/.local/share/alire/releases/ada_language_server_25.0.0_72b68d6b/gnat/lsp_server.gpr`
  - The executable artifact is:
    - `~/.local/share/alire/releases/ada_language_server_25.0.0_72b68d6b/.obj/server/ada_language_server`
  - For ease of use, this was copied to:
    - `~/bin/ada_language_server`
    - Verified via: `ada_language_server --version → ALS version: latest (unknown)`
  - Under `alr exec`, `PATH` includes `~/bin`, so:
    - `GNAT.OS_Lib.Locate_Exec_On_Path ("ada_language_server")` resolves to:
      - `/Users/rebecca/bin/ada_language_server`

---

## Relevant Code Paths

### 1. Client-side LSP library (ALS)

In the ALS repo (under the Alire build tree), the key client code is
`source/client/lsp-clients.ads/adb`:

- `procedure Initialize (Self : in out Client'Class)`
  - Populates `Notif_Decoders` with handlers for client-side notifications:
    - `"window/showMessage"`, `"window/logMessage"`,
      `"textDocument/publishDiagnostics"`, `"$/progress"`.

- `procedure Initialize_Request (Self; Request; Value : InitializeParams)`
  - Sends the `initialize` request and installs a decoder
    (`Decoders.Initialize_Response`) to handle the response.

- `On_Raw_Message`
  - Parses incoming JSON messages and dispatches them (responses and notifications)
    to appropriate decoders, which in turn call methods on the response or
    notification handlers.

### 2. Wrapper in this repo (`GPS.LSP_Clients`)

Key pieces in `src/gps-lsp_clients.adb`/`.ads`:

- `type LSP_Client` extends `LSP.Clients.Client` and implements:
  - `LSP_Client_Listener` callback interface (for the IDE/TUI front-end).
  - A response handler (`Response_Handler`) and request handler (`Request_Handler`).

- `procedure Start (Self : in out LSP_Client; Executable, Arguments, Initialization_Options)`
  - Sets the response and request handlers:
    - `Self.Set_Response_Handler (Self.Response_Handler'Unchecked_Access);`
    - `Self.Set_Request_Handler  (Self.Request_Handler'Unchecked_Access);`
  - Configures process parameters:
    - `Set_Program`, `Set_Arguments`, `Set_Environment`.
  - Stores `Initialization_Options`.
  - Calls `Self.Start` inherited from `LSP.Raw_Clients.Raw_Client`.

- `overriding procedure On_Started (Self : in out LSP_Client)`
  - Builds `InitializeParams` (capabilities, root URI, etc.).
  - Sends `initialize` via `Initialize_Request`.

- `Response_Handler.Initialize_Response`
  - Called when the `initialize` response is decoded.
  - Extracts and stores `ServerCapabilities`.
  - Sets `Self.Client.Is_Ready := True;`
  - Calls:
    - `Self.Client.On_Initialized_Notification;`
    - `Self.Client.Listener.On_Server_Started;`
    - `Process_Command_Queue (Self.Client.all);`
  - Our integration test polls `GPS.LSP_Clients.Is_Ready` as the indicator that
    this path ran successfully.

### 3. High-level ALS wrapper (`GPS.LSP_Client.Language_Servers.Real`)

Key pieces in `src/gps-lsp_client-language_servers-real.ads/adb`:

- `type Real_Language_Server (...)`
  - Extends `Abstract_Language_Server` and implements
    `GPS.LSP_Clients.LSP_Client_Listener`.
  - Contains a `Client : aliased GPS.LSP_Clients.LSP_Client`.

- `function Create (...) return not null Language_Server_Access`
  - Allocates a `Real_Language_Server` and then calls:
    - Local `Initialize` procedure:
      ```ada
      procedure Initialize (Self : in out Real_Language_Server'Class) is
      begin
         Self.Client.Initialize;
      end Initialize;
      ```
    - This ensures `LSP.Clients.Client.Initialize` is invoked before the server
      is started, which is the intended usage.

- `procedure Start (Self : in out Real_Language_Server'Class)`
  - Calls `Self.Client.Start` with:
    - `Executable` derived from `Configuration.Server_Program.Full_Name.all`.
    - `Arguments` from `Configuration.Server_Arguments`.
    - `Initialization_Options` from `Configuration.Configuration_Settings`.

- `overriding procedure On_Server_Started (Self : in out Real_Language_Server)`
  - Signals readiness internally (for example, our diagnostics logger writes
    a `server-started` entry) and the client’s `Is_Ready` flag flips to True.

---

## Known Good Reference: VS Code Extension

In the `ada_language_server` repo, VS Code integration lives under:

- `integration/vscode/ada/`
  - `package.json`, `src/extension.ts`, etc.

In this Alire-based setup, the full ALS source tree (including the VS Code
extension) is present locally at:

- `~/.local/share/alire/releases/ada_language_server_25.0.0_72b68d6b`
- VS Code extension path on disk:
  - `~/.local/share/alire/releases/ada_language_server_25.0.0_72b68d6b/integration/vscode/ada`

This means we can inspect the actual extension sources (TypeScript) without
leaving this machine, and use them as a “known good” reference for how a
client should configure and talk to `ada_language_server`.

This extension is the “known good” client:

- It uses `vscode-languageclient` (TypeScript) to:
  - Launch `ada_language_server` with appropriate arguments.
  - Configure `initializationOptions` (e.g., `projectFile`, `enableDiagnostics`).
  - Send `workspace/didChangeConfiguration` with `settings.ada.*`.
  - Send `textDocument/*` notifications and requests.
  - Consume `publishDiagnostics` and other notifications.

We don’t have the TS code copied into this repo, but it is available on the same
machine and in the GitHub repo. It is the best reference for ALS configuration
and expected message shapes.

---

## Why the Integration Test Fails Today

Given the refactor to use `Real.Create` + `Real.Start`, we now:

- Correctly call `Client.Initialize` (via `Real.Initialize`).
- Correctly call `Client.Start`, which:
  - Installs handlers.
  - Spawns `ada_language_server`.
  - Sends `initialize` from `On_Started`.

However:

- `GPS.LSP_Clients.Is_Ready` never flips to True within the 5-second timeout in
  `ALS_Diagnostics_On_Typo`.
- This means:
  - Either ALS is not replying to `initialize` in a way our wrapper expects, or
  - ALS is replying, but our client doesn’t recognize or decode the response
    as a valid `Initialize_Response`.
  - In either case, `Response_Handler.Initialize_Response` is never reached,
    so `Is_Ready` remains `False` and our readiness poll never succeeds.

This is not due to incorrect Start/Initialize ordering anymore; we are aligned
with the API usage expected by `GPS.LSP_Client.Language_Servers.Real`. The
remaining work is to understand **why ALS doesn’t complete the initialize
handshake** in this test harness.

---

## Plan: Use VS Code as a Reference & Add Traces

The VS Code extension is our reference client. We will:

1. Inspect the extension and ALS docs for the exact configuration and message
   flow VS Code uses.
2. Compare that to the messages our Ada client sends.
3. Add tracing on both client and server to see where the handshake diverges.

### Step 1: Study the VS Code Extension Behavior

- Read `integration/vscode/ada/src/extension.ts` (and related files) in the
  ALS repo:
  - Identify:
    - How `ada_language_server` is launched (command, args).
    - How `initializationOptions` are built (especially `projectFile`,
      `enableDiagnostics`, `enableIndexing`, etc.).
    - How `workspace/didChangeConfiguration` payloads are structured.
    - Whether an explicit `initialized` notification is sent and when.
  - Extract sample JSON messages for:
    - `initialize` request and response.
    - `workspace/didChangeConfiguration`.
    - Early `textDocument/didOpen` and `textDocument/didChange`.
- Create a small doc in this repo (for dev use only), e.g.:
  - `doc/als_vscode_samples.md`
  - Paste selected messages (sanitized) as canonical examples.

### Step 2: Align Our Initialize & Configuration

- Compare our `InitializeParams` in `GPS.LSP_Clients.On_Started` with the
  VS Code samples:
  - `processId`, `rootUri`, `capabilities`, `workspaceFolders`, etc.
  - Ensure `rootUri` points to a real directory (in tests, a temp workspace).
  - Confirm we’re not missing any mandatory fields ALS depends on.

- Extend `GPS.LSP_Client.Configurations.ALS.Configuration_Settings`:
  - Currently returns an empty JSON object.
  - Implement a minimal version that sets ALS-specific options, e.g.:
    - `projectFile`: if we introduce a `.gpr` under the test workspace, or
      rely on ALS’s auto-detection.
    - `enableDiagnostics`: explicitly `true` if we want deterministic behavior.
  - This JSON is sent as `initializationOptions` by `Real.Start`, wrapped in
    `Optional_LSP_Any`.

- Mirror VS Code’s configuration flow:
  - VS Code sends `workspace/didChangeConfiguration` with:
    ```json
    {
      "settings": {
        "ada": {
          "projectFile": "...",
          "enableDiagnostics": true,
          ...
        }
      }
    }
    ```
  - After we confirm `initialize` works, extend the integration test to send
    a matching `workspace/didChangeConfiguration` notification using
    `LSP.Messages.DidChangeConfigurationParams`.

### Step 3: Add Tracing & Logging

- **Client-side (Ada, in this repo)**
  - Use the lightweight diagnostics hook (`GPS.LSP_Client.Diagnostics`) to log:
    - `start`, `restart`, `shutdown` events.
    - `send-request`, `receive-reply`, and other lifecycle callbacks.
  - Enable logging via the `LSP_CLIENT_TRACE` environment variable. When set to
    a directory, the library writes timestamped trace files there.
  - Integration tests can set the variable to capture traces for debugging and
    leave it unset during normal runs.

- **Server-side (ALS)**
  - Use `--tracefile` support in ALS (see `doc/traces.md` in ALS repo):
    - Create a simple traces config enabling:
      - `ALS.MAIN` plus optionally `ALS.IN` and `ALS.OUT`.
    - In tests, set `Config.Server_Arguments` to include:
      - `--tracefile=/tmp/als_trace.cfg`
    - After a test run, inspect `/tmp/als_trace.cfg` logs for:
      - `initialize` request and response.
      - Any error diagnostics during initialization or project loading.

### Step 4: Split Integration Testing into Phases

To isolate issues, we treat integration as several smaller tests:

1. **Handshake-only test**
   - Add `ALS_Handshake_Only` in `Integration_Tests`:
     - Create temp workspace and callbacks as today.
     - Use `Real.Create` + `Real.Start`.
     - Wait (with a longer timeout, e.g. 10–15 seconds) for
       `GPS.LSP_Clients.Is_Ready (Client)` to become True.
     - Do *not* send `didOpen` or `didChange`.
   - If this still times out:
     - Check ALS traces for the presence of `initialize` and any exceptions.
     - Compare `initialize` JSON with the VS Code sample and adjust config.

2. **Open-only test**
   - Once handshake works reliably:
     - Add a test that:
       - Starts ALS.
       - Sends `didOpen` with valid Ada source.
       - Waits briefly for any diagnostics (accept either none or baseline).
     - Confirms ALS responds properly to `didOpen` notifications.

3. **Typo + diagnostics test (current test refined)**
   - Only after the above two tests pass:
     - Keep `ALS_Diagnostics_On_Typo` as the final end-to-end test.
     - Ensure it:
       - Locates ALS binary via `Locate_Exec_On_Path`.
       - Starts via `Real.Create` + `Real.Start`.
       - Sends `didOpen`, then `didChange` with a typo.
       - Waits for `publishDiagnostics` via `Diagnostics_Collector`.
     - On failure:
       - Confirm we see the `didChange` request in ALS traces.
       - Compare that `didChange` JSON with the VS Code equivalent.

At each phase, only one new variable is introduced, reducing ambiguity about
where problems arise.

### Step 5: Health Checks & Reporting

- Extend the integration tests to report:
  - The resolved ALS executable path.
  - Whether `On_Server_Started` fired and how long it took.
  - Whether any diagnostics were received at all for the test URI.
- Optionally, when a test fails and tracing is enabled:
  - Print the last few lines of the ALS trace file or a reference to it
    (e.g. `/tmp/als_trace.cfg`) so humans can inspect it quickly.

---

## Implementation Order (When Resuming)

When picking this back up, a practical order of work is:

1. In the ALS repo (outside this crate):
   - Capture sample `initialize` / `didChangeConfiguration` / `didOpen` /
     `didChange` messages from the VS Code extension.
   - Save them into `doc/als_vscode_samples.md` in this repo for reference.

2. In this repo:
   - Implement a minimal but meaningful `Configuration_Settings` in
     `GPS.LSP_Client.Configurations.ALS`, guided by ALS `doc/settings.md`.
   - Wire `--tracefile` into `Config.Server_Arguments` in the integration test
     (using a temp trace config file under `/tmp` or similar).
   - Add a handshake-only AUnit test in `Integration_Tests` and confirm
     `On_Server_Started` fires.
   - Once handshake is reliable, add/send `workspace/didChangeConfiguration`
     to match VS Code’s structure.
   - Only then refine `ALS_Diagnostics_On_Typo` and assert diagnostics content.

3. Iterate between:
   - Client-side logs (Ada).
   - ALS traces.
   - VS Code sample messages.

until the integration tests behave consistently and we understand the health
status for:

- Server startup & initialization,
- Project configuration,
- Text document synchronization,
- Diagnostics propagation.
