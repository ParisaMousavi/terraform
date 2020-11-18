provider "azurerm"{
    version = "1.44.0"

    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
    client_id = var.client_id
    client_secret = var.client_secret

}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg"{

    name = "lsn-customerkey-encryption"
    location = "westeurope"

    tags = {
        environment = "Test"
    }

}

resource "azurerm_storage_accoount" "storage" {
    name= ""
    resource_group_name= azurerm_resource_group.rg.name
    location= azurerm_resource_group.rg.location
    account_type= "StorageV2"
    account_tier= "Standard"
    account_replication_type= var.replicationType

}

resource "azurerm_storage_container" "container1" {
   name = "images"
   storage_account_name = azurerm_storage_account.storage.name
   container_access_type = "private"
}