# Intune GitOps Lite

Repository created for the Cloud Endpoint Summit 2026

## Entra ID App Registration

**Entra ID > App registrations > New registration**

Save the following:

- Application/Client ID

### App Registration Secret

**App registration > Certificates & secrets > New client secrety**

Save the following:

- Client secret value

### Graph API Application Permissions

**App registration > API permissions > Add a permission > Microsoft Graph > Application permissions**

```PowerShell
DeviceManagementApps.Read.All
DeviceManagementConfiguration.Read.All
DeviceManagementScripts.Read.All
DeviceManagementServiceConfig.Read.All
DeviceManagementManagedDevices.Read.All
DeviceManagementRBAC.Read.All
Group.Read.All
Policy.Read.All
Policy.Read.ConditionalAccess
Application.Read.All
```

## GitHub

**github.com > Sign in/Sign up**

### Personal Access Token

**github.com > Profile > Settings > Developer Settings > Personal access tokens**

- No expiry
- All repo permissions
- Save the generated token

### Repository

**github.com > Profile > Repositories > New**

- Set the name
- Set visibility to Private
- Add README

### Repository Secrets

**github.com > Repository > Settings > Secrets and variables > Actions**

From the saved content, create the following:

- `TENANT_NAME` – Primary domain
- `CLIENT_ID` – Application/Client ID
- `CLIENT_SECRET` – Client Secret
- `PAT` – GitHub Personal Access token
- `COMMIT_NAME` – GitHub username
- `COMMIT_EMAIL` – GitHub verified email

### Repository Actions

**github.com > Repository > Actions > Simple workflow**

- Filename intune-backup.yml
- Get a copy of intune-backup.yml from https://github.com/ennnbeee/CES2026
- Commit changes


## References

- IntuneCD - https://github.com/almenscorner/IntuneCD
- IntuneCD Wiki for Backups - https://github.com/almenscorner/IntuneCD/wiki/Backup
- IntuneCD Wiki for Documentations - https://github.com/almenscorner/IntuneCD/wiki/Document
- IntuneCD Wiki for Updates - https://github.com/almenscorner/IntuneCD/wiki/Update
- IntuneCD Monitor - https://github.com/almenscorner/intunecd-monitor
- Aaron Parker IntuneCD Local Guide - https://stealthpuppy.com/intunecd-local-environment/
- Aaron Parker IntuneCD GitHub Guide - https://stealthpuppy.com/automate-intune-documentation-github/
- Microsoft 365 Developer Program - https://developer.microsoft.com/en-us/microsoft-365/dev-program
