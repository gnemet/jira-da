---
description: Deploy services to target servers (butalam, gpu01)
---

# Deploy Services

1. Ask the user which services to deploy and to which server:
   - **Servers**: butalam (sys-butalam.alig.hu), gpu01 (sys-gpu01.alig.hu)
   - **Services**: jiramntr, johanna, mcp-forge, datagrid, lookin

2. For each service, look for the deploy script in the service repo:
   ```bash
   ls /home/nemetg/projects/<service>/scripts/deploy_*.sh
   ```

3. Run the appropriate deploy script:
   ```bash
   /home/nemetg/projects/<service>/scripts/deploy_<server>.sh
   ```

4. Report deployment status for each service.
