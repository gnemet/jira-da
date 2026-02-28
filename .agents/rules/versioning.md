# Versioning & Release Policy (Shared)

## Automatic Versioning
1. **Semver**: Increment the `version` in `config.yaml` using semantic versioning (`major.minor.patch`).
2. **Minor** for new features, **Patch** for fixes.
3. Increment whenever a new feature is added or a critical fix is made.

## Release Hygiene
1. **Single Release Policy**: Purge old releases/tags and deployment directories when a new version is released.
2. **`.env` Ignored**: All `.env*` files MUST be in `.gitignore`.
