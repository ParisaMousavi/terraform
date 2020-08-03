
# Reference
#   - https://www.youtube.com/watch?v=t9zYdokzmMs
#   - https://aws.amazon.com/powershell/ (do download aws .net sdk)
#   - https://www.youtube.com/watch?time_continue=432&v=AKqRoy3TxVw&feature=emb_logo
# install aws for powershell
Install-Module -Name AWS.Tools.Installer
Install-Module -Name AWS.Tools
# or
Install-Module -Name AWS.Tools.Installer -Force

# Setting up the AWS Tools for PowerShell involves the following high-level tasks, described in detail in this topic.
# 1- Install the AWS Tools for PowerShell package option that's appropriate for your environment.
# 2- Verify that script execution is enabled by running the Get-ExecutionPolicy cmdlet.
# 3- Import the AWS Tools for PowerShell module into your PowerShell session.

if ((Get-ExecutionPolicy) -ne "RemoteSigned"){
    Set-ExecutionPolicy RemoteSigned -Scope Process -Force
}

Get-ExecutionPolicy -List

Import-Module AWSPowerShell

# connect to aws via Access key and secret
Initialize-AWSDefaults 

if (!(Import-Module AWSPowerShell) ) {Import-Module AWSPowerShell}

Set-AWSCredentials -AccessKey "..." -SecretKey "..." -StoreAs ParisaFromPowershellProfile

Get-AWSCredentials -ListStoredCredentials

Initialize-AWSDefaults -ProfileName ParisaFromPowershellProfile -Region eu-west-1

# for installing aws services
Install-AWSToolsModule AWS.Tools.EC2 -CleanUp