# Create a resource group
resource "azurerm_resource_group" "devops_iac_rg01" {
  name     = "devopsiacrg01"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "iac_storage_account01" {
  name                     = "iacstorageaccount01"
  resource_group_name      =  azurerm_resource_group.devops_iac_rg01.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = local.common_tags
}

resource "azurerm_storage_container" "iac_storage_account01_container" {
  name                 = "imagens"
  storage_account_name = azurerm_storage_account.iac_storage_account01.name
}