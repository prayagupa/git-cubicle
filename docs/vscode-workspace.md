# VS Code Multi-Root Workspace

## Benefits

### 🗂 Single Window, Multiple Repos
Open all your repos side-by-side in one VS Code window instead of juggling multiple windows.

### 🔍 Unified Search & Navigation
`⌘⇧F` searches across **all repos at once** — great when code is split across microservices.

### ⚙️ Per-Repo + Shared Settings
Define settings globally in the `.code-workspace` file, or override them per folder — e.g. different linters, formatters, or Node versions per repo.

### 🐛 Unified Debugging
One `launch.json` can define debug configs for all repos — start multiple services from a single debug panel.

### 🔌 Extension Recommendations
Recommend the same set of extensions to everyone who opens the workspace via `extensions.recommendations` in the `.code-workspace` file — enforces consistency across a team.

### 📦 This Workspace
`adselection-microservice-nodejs`, `travel-with-nodejs`, and `config-using-chef` are developed together — the workspace lets you:
- Cross-reference code between them instantly
- Run and debug all services together
- Commit to each repo from the same Source Control panel (`⌃⇧G`)

## Tradeoff

Each folder is still an **independent git repo** — there is no single commit across all of them.
To commit across all repos at once, use one of:
- **VS Code Source Control panel** (`⌃⇧G`) — groups all repos in one view
- **`commit-all.sh`** script — loops through each repo from the root
- **`gita`** — CLI tool purpose-built for running git commands across multiple repos

## Opening the Workspace

```bash
code workspace.code-workspace
```

Or via **File → Open Workspace from File** in VS Code.
