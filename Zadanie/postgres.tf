resource "azurerm_postgresql_server" "postgres-raf" {
  name                = "postgres-raf"
  location            = azurerm_resource_group.rg-raf.location
  resource_group_name = azurerm_resource_group.rg-raf.name

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_4"
  version    = "9.6"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_virtual_network_rule" "postgres-raf-vnet-rule" {
  name                                 = "postgres-raf-vnet-rule"
  resource_group_name                  = azurerm_resource_group.rg-raf.name
  server_name                          = azurerm_postgresql_server.postgres-raf.name
  subnet_id                            = azurerm_subnet.vnet-rg-raf-postgres-subnet.id
  ignore_missing_vnet_service_endpoint = true
}