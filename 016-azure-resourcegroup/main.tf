# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "lesson-demo-rg"
  location = "West Europe"
}

# resource "azurerm_storage_account" "storage" {
#   name                     = "lessondemostorage"
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "staging"
#   }
# }