
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}


provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.44.0"

  subscription_id             = var.subscription_id
  client_id                   = var.client_id
  client_secret               = var.client_secret
  tenant_id                   = var.tenant_id
}

resource "azurerm_resource_group" "rg"{
    name    = "LessonCosmos"
    location    = "westeurope"

    tags = {
        Environment = "Terraform Getting Started"
        Team = "DevOps"
    }    
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "tf-cosmos-db-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type = "Standard"
  kind = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }

}

