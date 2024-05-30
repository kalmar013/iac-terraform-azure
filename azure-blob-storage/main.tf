terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.0.0"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.group_identifier
  location = var.group_region
}

resource "azurerm_storage_account" "example" {
  name                     = var.data_storage_id
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.data_tier
  account_replication_type = var.data_duplication

  tags = {
    environment = var.tag_environment
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.container_id
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = var.data_blob_name
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.blob_storage_type
  source                 = var.local_source_path
}
