# Create a resource group
resource "azurerm_resource_group" "devops_iac_rg01" {
  name     = "devopsiacrgremote"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "iac_storage_account01" {
  name                     = "iacstorageaccountremote"
  resource_group_name      = azurerm_resource_group.devops_iac_rg01.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = local.common_tags

  blob_properties {
    versioning_enabled = true
  }
}

resource "azurerm_storage_container" "iac_storage_account01_container" {
  name                 = "remote-state"
  storage_account_name = azurerm_storage_account.iac_storage_account01.name
}