---
description: Commit and push all repos with uncommitted changes
---

# Commit and Push All Repos

// turbo-all

1. Scan all git repos in `/home/nemetg/projects/` for uncommitted changes:
   ```bash
   for dir in /home/nemetg/projects/*/; do if [ -d "$dir/.git" ]; then name=$(basename "$dir"); changes=$(git -C "$dir" status --porcelain 2>/dev/null | wc -l); ahead=$(git -C "$dir" rev-list --count @{u}..HEAD 2>/dev/null || echo "no upstream"); if [ "$changes" -gt 0 ] || [ "$ahead" -gt 0 ]; then echo "=== $name === changes:$changes ahead:$ahead"; fi; fi; done
   ```

2. For each repo with changes, run:
   ```bash
   git -C /home/nemetg/projects/<repo> add -A
   git -C /home/nemetg/projects/<repo> commit -m "update <YYYY-MM-DD>"
   ```

3. Push all committed repos. If push is rejected (non-fast-forward), pull --rebase first then push:
   ```bash
   git -C /home/nemetg/projects/<repo> push || (git -C /home/nemetg/projects/<repo> pull --rebase && git -C /home/nemetg/projects/<repo> push)
   ```

4. Report a summary table showing each repo and its status (pushed, nothing to push, error).
