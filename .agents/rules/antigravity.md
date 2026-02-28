# Antigravity Core Rules (Shared)

> This is the **single source of truth** for core agent behavior across all repos.
> Project-specific extensions live in each repo's own `.agents/rules/project.md`.

## 1. Core Behavior
- **Proactive Execution**: Do not ask for permission to run tests, build scripts, SQL, or Go code.
- **Integrity**: Never modify "copied" files (check source/origin before editing).
- **Environment Awareness**: Always read `.env` from the project root. Supporting host-specific environments via `scripts/switch_env.sh`. Follow rules in [env_handling.md](env_handling.md).
- **Documentation**: All technical changes MUST be reflected in the project's `docs/` folder before any commit or push.

## 2. Security & Integrity
- **Persistence**: NEVER modify `.env` directly; it is ephemeral. Source of truth: `opt/envs/.env_<hostname>`.
- **Secrets**: Never commit `.env` or sensitive credentials to the repository.
- **Artifacts**: Keep internal artifacts like `implementation_plan.md` and `task.md` updated throughout the task.

## 3. Static Assets
- **`ui/css/`, `ui/js/`, `ui/vendor/`**: Static front-end assets. Never hardcode paths in Go handlers.
- **`ui/images/`**: If present, static assets served by the backend. Do not auto-generate; extract from DB or use official sources.
