resource "azurerm_storage_account" "storage-raf" {
  name                = var.storage-name
  resource_group_name = var.rg-name
  location = var.region
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}