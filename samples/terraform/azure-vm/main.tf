terraform {

  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "devopsiacrgremote"
    storage_account_name = "iacstorageaccountremote"
    container_name       = "remote-state"
    key                  = "azure-vm/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "devopsiacrgremote"
    storage_account_name = "iacstorageaccountremote"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}
