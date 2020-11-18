[[_TOC_]]
# Terraform

## Process

Planning Phase -> Cost Estimation -> Policy Checks -> Execution

### Orchestration vs. Configuration Management Tools

#### Configuration Management Tools
- Chef, Puppet, Ansible
- Match existing deployments
- Reconfigure existing environments
- Require extra infrastructure (overhead) e.g. Chef, Puppet require Master Server, and Agent on the Server, or Ansible is SSH daemon

#### Orchestration Tools
- Terraform, ARM Template
- Update resources
- Treat infrastructure as immutable

## Start with Terraform

Start the PowerShell as Admin and run this code to install Choco.
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Then install Terraform
```powershell
choco install terraform
```

To upgrade with Choco use this command
```powershell
choco upgrade terraform
```

## Use Terraform variables file
 A `variables.tf` file must be added [[Source](https://learn.hashicorp.com/tutorials/terraform/aws-variables)]. I used this file for secret for connecting to Azure.

 ```hcl
 variable "subscription_id" {
    default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "client_id" {
    default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "client_secret" {
    default = "secret"
}

variable "tenant_id" {
    default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}


 ```

## Destroy with Terraform
 ```hcl
 terraform destroy
 ```





 ## Resource
 * https://learn.hashicorp.com/tutorials/terraform/azure-dependency?in=terraform/azure-get-started