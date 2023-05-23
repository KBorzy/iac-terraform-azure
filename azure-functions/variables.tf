variable "resource_group_name" {
  type    = string
  default = "myResourceGroup"
}

variable "resource_group_location" {
  type    = string
  default = "westeurope"
}

variable "storage_account_name" {
  type    = string
  default = "mystorageaccount"
}

variable "app_service_plan_name" {
  type    = string
  default = "myAppServicePlan"
}

variable "function_app_name" {
  type    = string
  default = "myFunctionApp"
}