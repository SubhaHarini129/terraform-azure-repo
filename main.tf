terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # latest major version
    }
  }

  required_version = ">= 1.3.0"

   backend "azurerm" {
    resource_group_name  = "learn-terraform-rg"
    storage_account_name = "harinilearnterraform123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider azurerm {
    features {}
    subscription_id = "320fb61f-2500-4465-9cb2-ca21d99aa5b2"
}

# resource "azurerm_resource_group" "rg" {
#   name     = "learn-terraform-rg"
#   location = "East US"
# }


resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
}

# CLI command to create tfstate container for the storage account
# az storage container create \
#   --name tfstate \
#   --account-name harinilearnterraform123

resource "azurerm_virtual_network" "vnet" {
  name                = "learn-terraform-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
