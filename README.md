# JiraDa Platform

Unified project environment for the JiraDa enterprise platform.

## Quick Start

```bash
git clone https://github.com/gnemet/jira-da.git
cd jira-da
chmod +x scripts/setup.sh
./scripts/setup.sh
```

This clones all repos and sets up the workspace. Then open in VS Code:

```bash
code jira-da.code-workspace
```

## Repos

| Repo | Description |
|------|-------------|
| [aichat](https://github.com/gnemet/aichat) | AI chat module (RAG, MCP pipeline) |
| [jiramntr](https://github.com/gnemet/jiramntr) | JIRA DWH monitor (ETL, KPI, BI) |
| [johanna](https://github.com/gnemet/johanna) | AI persona chat assistant |
| [datagrid](https://github.com/gnemet/datagrid) | Dynamic data grid & pivot tables |
| [lookin](https://github.com/gnemet/lookin) | Architecture viewer |
| [mcp-forge](https://github.com/gnemet/mcp-forge) | MCP chain & RAG catalog builder |

## Project Board

[JiraDa Board](https://github.com/users/gnemet/projects/2) — tracks bugs, features, and tasks across all repos.

## Agent Workflows

| Command | Description |
|---------|-------------|
| `/commit-all` | Add, commit, and push all repos |
| `/new-issue` | Create issue and add to project board |
| `/deploy` | Deploy services to servers |
