az login
Connect-AzAccount

az account list --query "[].{name:name, subscriptionId:id}"

az account set --subscription="OOO"

# create a service principal for terraform on resource group scope
# https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html
az ad sp create-for-rbac -n "sample-terraform-rg" --role contributor --scope "/subscriptions/OOO/resourceGroups/sample-terraform-rg"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/OOO" --name="terraform"

az group create --name "sample-terraform-rg" --location "eastus"

# for keeping terraform state file
az storage account create --resource-group "sample-terraform-rg" --name "sampleterraform" --sku "Standard_LRS" --encryption-services blob

az storage account keys list --resource-group "sample-terraform-rg" --account-name "sampleterraform"
# Copy one of the keys

# Create a container in storage account
az storage container create --name "terrform" --account-name "sampleterraform" --account-key "storage-key" 

# test service principal
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID

Source: https://www.youtube.com/watch?v=kqwzqWcSCYM