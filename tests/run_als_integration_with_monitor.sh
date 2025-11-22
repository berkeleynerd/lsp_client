#!/usr/bin/env bash

set -euo pipefail

# Simple harness to run the ALS integration tests while:
#  - Watching for ada_language_server processes in the system process list
#  - Collecting any ALS log files created during the run
#
# Usage:
#   ./tests/run_als_integration_with_monitor.sh
#
# This script does not modify the test binaries; it wraps
# `alr run integration_tests_main` and writes its own logs
# in the project root.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

ALS_BIN="$(command -v ada_language_server || true)"
if [[ -z "${ALS_BIN}" ]]; then
   echo "[monitor] ada_language_server not found on PATH" >&2
   exit 1
fi

echo "[monitor] Using ada_language_server at: ${ALS_BIN}"

mkdir -p "${HOME}/.als"

MARKER="${HOME}/.als/als_test_marker.$$"
> "${MARKER}"

PS_LOG="${ROOT_DIR}/als_ps_monitor.log"
LOG_SUMMARY="${ROOT_DIR}/als_logs_after_integration.log"
> "${PS_LOG}"
> "${LOG_SUMMARY}"

echo "[monitor] Starting integration tests (alr run integration_tests_main) ..."

alr run integration_tests_main &
TEST_PID=$!

monitor_ps() {
   while kill -0 "${TEST_PID}" 2>/dev/null; do
      {
         echo "----- $(date -u +"%Y-%m-%dT%H:%M:%S.%3NZ") -----"
         ps aux | grep "[a]da_language_server" || echo "no ada_language_server process"
      } >> "${PS_LOG}"
      sleep 0.25
   done
}

monitor_ps &
MON_PID=$!

wait "${TEST_PID}" || true
TEST_RC=$?

wait "${MON_PID}" 2>/dev/null || true

{
   echo "[monitor] integration_tests_main exited with code ${TEST_RC}"
   echo
   echo "[monitor] ALS processes seen during test:"
   if grep -q "ada_language_server" "${PS_LOG}"; then
      grep "ada_language_server" "${PS_LOG}"
   else
      echo "  none"
   fi

   echo
   echo "[monitor] ALS logs created under \$HOME/.als during test:"
   find "${HOME}/.als" -maxdepth 1 -name 'ada_ls_log.*.log' -newer "${MARKER}" -print || true

   echo
   for f in $(find "${HOME}/.als" -maxdepth 1 -name 'ada_ls_log.*.log' -newer "${MARKER}" -print 2>/dev/null); do
      echo "===== ${f} (tail) ====="
      tail -n 40 "${f}" || true
      echo
   done

   echo "[monitor] ALS logs under /tmp (if any):"
   find /tmp -maxdepth 3 -name 'als_*log*' -newer "${MARKER}" 2>/dev/null || true
} >> "${LOG_SUMMARY}"

rm -f "${MARKER}"

echo "[monitor] Process monitor log: ${PS_LOG}"
echo "[monitor] ALS log summary:    ${LOG_SUMMARY}"

exit "${TEST_RC}"

