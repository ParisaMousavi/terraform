[[_TOC_]]
# Introduction
For using Terraform, we have to have a terraform account, because the first section of terrafom file refere to a gallery of terraform, therefore we need a user to login and ontain a API token.

```powershell
terraform login
```

After successful login the following enty is added to `C:\Users\P.Moosavinezhad\AppData\Roaming\terraform.d\credentials.tfrc.json` file.

```json
credentials "app.terraform.io" {
  token = "XXXXXXXXXXXXXXX.atlasv1.XXXXXX...."
}
```

# Install Terraform

1. Go to Terraform's Home Page https://www.terraform.io/downloads.html.
2. Download the terraform zip file.
3. Copy and paste the `terraform.exe` file in a folder.
4. Add the terraform path to the `System Environment`.
5. Use the following  link as `Quick start`

# Terraform file structure
1. provider
2. resource

```hcl
# the provider definition for AWS
provider "aws" {
  access_key = ""
  secret_key = ""
  region = ""
}

```