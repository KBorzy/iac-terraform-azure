resource "azurerm_resource_group" "example" {
    name = var.resource_group_name
    location = var.resource_group_location
}

resource "azurerm_storage_account" "example" {
    name = var.storage_account_name
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example" {
    name = var.app_service_plan_name
    location = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    kind = "Linux"
    reserved = true

    sku {
      tier = "Dynamic"
      size = "Y1"
    }
}

resource "azurerm_linux_function_app" "example" {
    name = var.function_app_function_name
    location = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    storage_account_name = azurerm_storage_account.example.name
    os_type = "linux"
    runtime_stack = "NODE|14-lts"
    app_settings = {
        "FUNCTIONS_WORKER_RUNTIME" = "node"
    }
}

resource "azurerm_function_app_function" "example" {
  function_name = "myFunction"
  resource_group_name = azurerm_resource_group.example.name
  functionapp_name = azurerm_linux_function_app.example.name
  storage_connection_string = azurerm_storage_account.example.primary_connection_string
  enabled = true
}