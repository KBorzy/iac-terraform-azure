resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "example" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_blob" "example" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.storage_blob_type
  source                 = var.storage_blob_source
}
variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
}

variable "resource_group_location" {
  description = "Lokalizacja grupy zasobów"
  type        = string
}

variable "storage_account_name" {
  description = "Nazwa konta przechowywania"
  type        = string
}

variable "storage_account_tier" {
  description = "Typ konta przechowywania"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Typ replikacji konta przechowywania"
  type        = string
  default     = "LRS"
}

variable "storage_container_name" {
  description = "Nazwa kontenera przechowywania"
  type        = string
}

variable "storage_container_access_type" {
  description = "Typ dostępu do kontenera przechowywania"
  type        = string
  default     = "private"
}

variable "storage_blob_name" {
  description = "Nazwa bloba przechowywania"
  type        = string
}

variable "storage_blob_type" {
  description = "Typ bloba przechowywania"
  type        = string
  default     = "Block"
}

variable "storage_blob_source" {
  description = "Ścieżka źródłowa bloba przechowywania"
  type        = string
}
