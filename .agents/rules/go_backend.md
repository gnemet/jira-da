# Go Back-end Rules (Shared)

## Architecture
- **Standard Library**: Prefer Go standard library for HTTP server and routing.
- **Concurrency**: Leverage Go routines for background tasks (e.g., `saveHistory`, async ETL).
- **Graceful Failures**: Return clean error fragments or log context for 500 errors to aid debugging.

## Logging
- **Use `log/slog` exclusively.** Never use `log.Printf`/`log.Println`/`log.Fatalf`/`log.Fatal` — use `slog.Info`, `slog.Warn`, `slog.Error` with structured key-value pairs.
- **Pattern**: `slog.Info("message", "key1", val1, "key2", val2)` — not `slog.Info(fmt.Sprintf(...))`.
- **Levels**: `slog.Info` for normal flow, `slog.Warn` for recoverable issues, `slog.Error` for failures.
- **Fatal errors**: Use `slog.Error(...)` followed by `os.Exit(1)` instead of `log.Fatalf`.

## Session & History
1. **Session Isolation**: Every new frontend session (e.g., page load/refresh) MUST initiate a fresh history file on the backend.
2. **Metadata-Rich History**: Saved Markdown history files MUST include timestamps in message headers: `## COMPONENT <HH:MM:SS>` and `## USER <HH:MM:SS>`.
3. **Sanitized Naming**: History filenames should be formatted as `YYYYMMDD_HHMMSS_FirstFiveWords.md`.

## Configuration
- **Config-Driven**: Connection strings, timeouts, and pool limits MUST be loaded from `config.yaml` and environment variables.
- **No Hardcoding**: Follow the Zero Defaults policy from [env_handling.md](env_handling.md).
