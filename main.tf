terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "02e5fa2a-c206-46c7-8051-550748577864"
  tenant_id       = "48227055-1b42-4229-b964-ee9b2177ee14"
  client_id       = "776f6ed8-2b09-4530-a833-88db644fb389"
  client_secret   = "ZQb8Q~OiUaxDz10fSg2Qcq2RLo0UHveW-CK_Bau_" 
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create a storage account
resource "azurerm_storage_account" "example-storage" {
  name                     = "azstorageaccountpras"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}