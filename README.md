# git-workspace

A multi-root VS Code workspace for local development across several projects.

## Repositories

| Repo | Description |
|------|-------------|
| [adselection-microservice-nodejs](https://github.com/prayagupa/adselection-microservice-nodejs) | Ad selection microservice built with Node.js |
| [travel-with-nodejs](https://github.com/prayagupa/travel-with-nodejs) | Travel application built with Node.js |
| [config-using-chef](https://github.com/prayagupa/config-using-chef) | Infrastructure configuration using Chef |

## Getting Started

Clone all repositories at once using the provided script:

```bash
chmod +x clone-workspaces.sh
./clone-workspaces.sh
```

Or clone into a custom directory:

```bash
./clone-workspaces.sh --dir ~/projects
```

The script is idempotent — safe to re-run; already-cloned repos are skipped.

### Clone manually (HTTPS)

```bash
git clone https://github.com/prayagupa/adselection-microservice-nodejs.git
git clone https://github.com/prayagupa/travel-with-nodejs.git
git clone https://github.com/prayagupa/config-using-chef.git
```

### Clone manually (SSH)

```bash
git clone git@github.com:prayagupa/adselection-microservice-nodejs.git
git clone git@github.com:prayagupa/travel-with-nodejs.git
git clone git@github.com:prayagupa/config-using-chef.git
```

### Clone via GitHub CLI

```bash
gh repo clone prayagupa/adselection-microservice-nodejs
gh repo clone prayagupa/travel-with-nodejs
gh repo clone prayagupa/config-using-chef
```

---

