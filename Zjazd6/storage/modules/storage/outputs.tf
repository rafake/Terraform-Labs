output "primary-key" {
    value = azurerm_storage_account.storage-raf.id
    description = "ID of storage"
}

output "primary_web_endpoint" {
    value = azurerm_storage_account.storage-raf.primary_web_endpoint
    description = "endpoint of storage"
}