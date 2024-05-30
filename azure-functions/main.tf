resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.loc
}

resource "azurerm_storage_account" "example" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.sa_tier
  account_replication_type = var.replication_type

  tags = {
    environment = var.env_tag
  }
}

data "azurerm_service_plan" "example" {
  name                = var.app_service_plan
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_linux_function_app" "example" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = data.azurerm_service_plan.example.id

  site_config {}
}

resource "azurerm_function_app_function" "example" {
  name            = var.func_name
  function_app_id = azurerm_linux_function_app.example.id
  language        = "Python"
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = var.func_bindings
}
