variable "group_identifier" {
  description = "Identifies the resource group"
  default     = "initial-example"
}

variable "group_region" {
  description = "Geographic location for the resource group"
  default     = "EU-West"
}

variable "data_storage_id" {
  description = "Identifier for Azure storage account"
  default     = "datastorageunique"
}

variable "data_tier" {
  description = "Tier classification of the storage account"
  default     = "Std"
}

variable "data_duplication" {
  description = "Data duplication model used"
  default     = "Global Redundant Storage"
}

variable "tag_environment" {
  description = "Environment tag classification"
  default     = "test"
}

variable "container_id" {
  description = "Storage container identifier"
  default     = "datafiles"
}

variable "data_blob_name" {
  description = "Name of the blob within the container"
  default     = "important-data.zip"
}

variable "blob_storage_type" {
  description = "Storage type of the blob"
  default     = "BlobBlock"
}

variable "local_source_path" {
  description = "File path for the source blob file"
  default     = "local-source.zip"
}
