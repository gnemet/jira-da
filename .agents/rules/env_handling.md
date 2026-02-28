# Environment Handling Rules (Shared)

## The Full Lifecycle

```
Developer Machine:
  1. Create/edit opt/envs/.env_<hostname>          ← plaintext, NEVER committed
  2. ./scripts/vault.sh lock <hostname>            ← creates .env_<hostname>.gpg
  3. git add opt/envs/.env_<hostname>.gpg           ← GPG committed to GitHub
  4. ./scripts/switch_env.sh <hostname>            ← copies plaintext → root .env

New Machine / Clone:
  1. git clone (gets .gpg files)
  2. ./scripts/vault.sh unlock <hostname>          ← restores plaintext from .gpg
  3. ./scripts/switch_env.sh <hostname>            ← copies plaintext → root .env

Prod / Test Server:
  → Only root .env exists (manually placed or deployed)
  → opt/envs/ does NOT exist, is NEVER deployed
```

## 1. Runtime: Only Root `.env`
- Application code MUST only read from the **root `.env`** (and optionally `config.yaml` / `envcfg.yaml`).
- **NEVER** reference `opt/envs/` in application code, Go handlers, or Python scripts.
- `opt/envs/` is a **local development tool** — it does NOT exist in prod/test.

## 2. Direct Modification Forbidden (Dev)
- On developer machines, **NEVER** edit root `.env` directly for persistent changes.
- Root `.env` is ephemeral — overwritten by `switch_env.sh`.
- Temporary edits acceptable ONLY for one-off debugging.

## 3. Vault Workflow (GPG)
- **Lock** (encrypt): `./scripts/vault.sh lock <hostname>` → creates `.gpg`
- **Unlock** (decrypt): `./scripts/vault.sh unlock <hostname>` → restores plaintext
- **Verify**: `./scripts/vault.sh verify <hostname>` → SHA256 comparison
- **Diff**: `./scripts/vault.sh diff <hostname>` → show changes
- **Status**: `./scripts/vault.sh status <hostname>` → check if re-lock needed
- Vault password: `VAULT_PASS` env var or `~/.vault_pass` file

## 4. `.gitignore` Pattern (Mandatory)
```gitignore
# Plaintext env files: NEVER committed
.env*
**/.env*
!**/*.gpg

# opt/envs: only .gpg files committed
opt/**
!opt/**/
!*.gpg

# Vault password: NEVER committed
.vault_pass
```

## 5. Switching Environments
```bash
./scripts/switch_env.sh <hostname>    # explicit
./scripts/switch_env.sh               # auto-detect from hostname
```

### Standard Environment Postfixes
Postfixes MUST match the **actual hostname** for auto-detect to work:

| Postfix | Machine | Type |
|---|---|---|
| `IT-2057` | Desktop dev | dev |
| `zenbook` | Private dev | dev |
| `butalam` | Production server | prod |
| `sys-gpu01` | GPU server | prod |

Example: `.env_IT-2057`, `.env_butalam`, `envcfg_zenbook.yaml`

## 6. No Hardcoding (Zero Defaults)
- **NEVER** hardcode env var values or fallback defaults in code.
- **NEVER** use `getEnvOrDefault(...)` — fail clearly when missing.
- Use cascade pattern if needed: `RAG_PG_HOST → PG_HOST → fail`.
- Fixed data (company name, etc.) belongs in `config.yaml`, NOT `.env`.
