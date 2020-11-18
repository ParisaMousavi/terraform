provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=2.20.0"

  subscription_id             = var.subscription_id
  client_id                   = var.client_id
  client_secret               = var.client_secret
  tenant_id                   = var.tenant_id

  features {}
}

terraform{
    # Source : https://www.terraform.io/docs/backends/types/azurerm.html
    backend "azurerm" {
        resource_group_name = "sample-terraform-rg"
        storage_account_name = "sampleterraform"
        container_name = "terrform"
        key = "development.terraform.tfstate"
    }
}

data "azurerm_client_config" "current" {}


resource "azurerm_resource_group" "rg" {
    name = "sample-rg"
    location = "west us"
}
