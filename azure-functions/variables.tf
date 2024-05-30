variable "rg_name" {
  description = "Name of the resource group"
  default     = "example-resources"
}

variable "loc" {
  description = "Geographic location"
  default     = "West Europe"
}

variable "sa_name" {
  description = "Name for storage account"
  default     = "storageaccountname"
}

variable "sa_tier" {
  description = "Performance tier of storage account"
  default     = "Standard"
}

variable "replication_type" {
  description = "Type of data replication for storage"
  default     = "GRS"
}

variable "env_tag" {
  description = "Tag for the deployment environment"
  default     = "staging"
}

variable "app_service_plan" {
  description = "Service plan for hosting solutions"
  default     = "existing"
}

variable "app_name" {
  description = "Name of the Function App"
  default     = "example-linux-function-app"
}

variable "func_name" {
  description = "Specific function within the app"
  default     = "example-function-app-function"
}

variable "func_bindings" {
  description = "JSON config for function triggers and outputs"
  type        = string
  default     = <<EOF
{
  "bindings": [
    {
      "authLevel": "function",
      "direction": "in",
      "methods": ["get", "post"],
      "name": "req",
      "type": "httpTrigger"
    },
    {
      "direction": "out",
      "name": "$return",
      "type": "http"
    }
  ]
}
EOF
}
