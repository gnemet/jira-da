---
description: Create a GitHub issue and add it to the JiraDa project board
---

# Create Issue and Add to JiraDa Project

1. Ask the user for:
   - **Title**: short description of the bug or feature
   - **Body**: detailed description (optional)
   - **Repo**: which repo this belongs to (aichat, jiramntr, johanna, datagrid, lookin, mcp-forge)
   - **Type**: Bug (📝) or Feature (📬)

2. Create the issue:
   ```bash
   gh issue create --repo gnemet/<repo> --title "<title>" --body "<body>"
   ```

3. Get the issue node ID:
   ```bash
   gh api graphql -f query='query { repository(owner: "gnemet", name: "<repo>") { issue(number: <N>) { id } } }'
   ```

4. Add to JiraDa project (ID: `PVT_kwHOAFp6lc4BQZAh`):
   ```bash
   gh api graphql -f query='mutation { addProjectV2ItemById(input: { projectId: "PVT_kwHOAFp6lc4BQZAh", contentId: "<issue_id>" }) { item { id } } }'
   ```

5. Set status based on type:
   - Bug → `📝 Bug` (id: `6d08a1c3`)
   - Feature → `📬 Feature` (id: `a0006ec1`)

   ```bash
   gh api graphql -f query='mutation { updateProjectV2ItemFieldValue(input: { projectId: "PVT_kwHOAFp6lc4BQZAh", itemId: "<item_id>", fieldId: "PVTSSF_lAHOAFp6lc4BQZAhzg-hls8", value: { singleSelectOptionId: "<status_id>" } }) { projectV2Item { id } } }'
   ```
