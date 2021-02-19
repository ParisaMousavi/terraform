
data "azurerm_client_config" "current" {}


data "azurerm_resource_group" "rg" {
  name = "azure-function-rg"
}

data "azurerm_storage_account" "stor" {
  name                = "storageaccountazurea049"
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_function_app" "funcapp" {
    name = "pmdemofunctionapp"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    storage_account_name = azurerm_storage_account.stor.name
    storage_account_access_key = azurerm_storage_account.stor.primary_access_key
  
}