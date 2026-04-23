#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# clone-workspaces.sh
#
# Clones all required workspace repositories from GitHub.
# Idempotent: skips repos that are already cloned.
#
# Usage:
#   chmod +x clone-workspaces.sh
#   ./clone-workspaces.sh [--dir <target-directory>]
#
# Options:
#   --dir   Base directory to clone repos into (default: parent of this script)
# ---------------------------------------------------------------------------

set -euo pipefail

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------
readonly GITHUB_BASE_URL="https://github.com/prayagupa"
readonly REPOS=(
  "adselection-microservice-nodejs"
  "travel-with-nodejs"
  "config-using-chef"
)

# ---------------------------------------------------------------------------
# Defaults
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$(dirname "$SCRIPT_DIR")"

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dir)
      TARGET_DIR="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      echo "Usage: $0 [--dir <target-directory>]" >&2
      exit 1
      ;;
  esac
done

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
log_info()    { echo "[INFO]  $*"; }
log_success() { echo "[OK]    $*"; }
log_skip()    { echo "[SKIP]  $*"; }
log_error()   { echo "[ERROR] $*" >&2; }

check_dependencies() {
  local missing=0
  for cmd in git curl; do
    if ! command -v "$cmd" &>/dev/null; then
      log_error "Required command not found: $cmd"
      missing=1
    fi
  done
  [[ $missing -eq 0 ]] || exit 1
}

clone_repo() {
  local repo="$1"
  local dest="$TARGET_DIR/$repo"
  local url="$GITHUB_BASE_URL/$repo.git"

  if [[ -d "$dest/.git" ]]; then
    log_skip "$repo already cloned at $dest"
    return 0
  fi

  log_info "Cloning $repo → $dest"
  if git clone "$url" "$dest"; then
    log_success "$repo cloned successfully"
  else
    log_error "Failed to clone $repo from $url"
    return 1
  fi
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
  log_info "Target directory: $TARGET_DIR"
  log_info "Repos to clone:   ${REPOS[*]}"
  echo ""

  check_dependencies

  mkdir -p "$TARGET_DIR"

  local failures=0
  for repo in "${REPOS[@]}"; do
    clone_repo "$repo" || ((failures++))
  done

  echo ""
  if [[ $failures -eq 0 ]]; then
    log_success "All repositories are ready."
  else
    log_error "$failures repo(s) failed to clone. Review errors above."
    exit 1
  fi
}

main "$@"
