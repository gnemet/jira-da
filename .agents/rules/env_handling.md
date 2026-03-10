# Environmental Variable Handling & Security Rule

To ensure the highest security profile for this application, development and operations must **never** specify or calculate default fallbacks containing passwords, API keys, or standard infrastructure configuration.

This means the application **must fail fast** and loud if it boots missing the required credentials, instead of defaulting to a known (and easily guessable) path or password.

## Mandatory Rules
1. **No Hardcoded Passwords**: Strings like `soa123`, `Jira_1234`, or `root` must never be hardcoded into tools, scripts, test files, or `.go` files.
2. **No `viper.SetDefault` for sensitive info**: Do not use `SetDefault` for ports, hosts, passwords, or usernames in configuration parsers.
3. **No `os.environ.get('KEY', 'fallback')`**: Python scripts should use `os.environ.get('KEY')` alone, compute if any required variable is `None`, and `sys.exit(1)` immediately if missing.
4. **No Shell Default Expansions**: Avoid `export PGPASSWORD=${PGPASSWORD:-soa123}` in bash scripts. Required variables must be explicitly asserted:
   ```bash
   if [[ -z "${PGPASSWORD}" ]]; then
       echo "Error: PGPASSWORD environment variable is required."
       exit 1
   fi
   ```
5. **No fallback Struct Population**: Do not manually copy values from one struct to another as a fallback mechanism for configuration, such as pointing a read-only DB connection to the primary DB connection if the RO ENV variables are missing. Require the operator to explicitly define them.

> [!CAUTION] 
> **Security Audit Failure**
> A codebase failing to adhere to these zero-fallback requirements will automatically fail security audits. Any PR or generation containing these patterns should be immediately rejected.
