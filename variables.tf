variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "learn-terraform-rg"
}

variable "storage_account_name" {
  description = "Globally unique name for the Storage Account"
  type        = string
  default     = "harinilearnterraform123" # must be globally unique
}

variable "storage_account_tier" {
  description = "Tier of the Storage Account"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication" {
  description = "Replication strategy"
  type        = string
  default     = "LRS"
}
