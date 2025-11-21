# Repository Guidelines

## Project Structure & Module Organization
- `src/`: Ada sources for the `GPS.LSP_Client.*` hierarchy (protocol-only LSP client core).
- `config/`: GPR project files and C headers used to integrate this library into larger builds.
- Repository root: `alire.toml`, `lsp_client_lib.gpr`, and build metadata. Files like `*.ali`, `*.o`, and `*.stderr/.stdout` are build artifacts; do not edit or commit them.

## Build, Test, and Development Commands
- `alr build`: Build the library using `lsp_client_lib.gpr` with the default profile.
- `alr exec -- gprbuild -P lsp_client_lib.gpr`: Run an explicit GNAT build using the same project file.
- This crate produces a library only; consumers are expected to provide the `ada_language_server` executable on `PATH`.

## Coding Style & Naming Conventions
- Ada code follows GNAT style with consistent indentation (3 spaces), one declaration per line, and aligned `is` where practical.
- Package names stay under `GPS.LSP_Client.*`; new units follow the existing `gps-lsp_client-*.adb/.ads` naming pattern in `src/`.
- Preserve existing license and header comments; keep comments wrapped around 72–78 columns.
- Use descriptive `Camel_Case` identifiers; avoid single-letter names except for obvious loop indices.

## Testing Guidelines
- There is no standalone test suite in this crate yet; behavior is primarily validated through parent applications that depend on it.
- When adding tests, prefer AUnit or a simple Ada test driver under a future `tests/` directory and wire it via `alr test` and a dedicated GPR.
- Document manual test steps for new behavior in the pull request if no automated test can be added.

## Commit & Pull Request Guidelines
- Use short, imperative commit messages (for example, `Add LSP shutdown helper`, `Refactor hover requests`).
- Pull requests should include a brief motivation, summary of key changes, and any protocol or API impacts; link related issues when available.
- Include build and test instructions in the PR description, along with any relevant logs when diagnosing failures.

## Agent-Specific Instructions
- Prefer minimal, targeted changes that preserve existing APIs, package names, and project layout.
- Do not reformat unrelated files or rename public packages without explicit justification in the PR description.

