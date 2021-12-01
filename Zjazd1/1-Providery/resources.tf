resource "azurerm_storage_account" "example" {
  name                     = "mz12teststorage0908080"
  # resource_group_name = azure_resource_group.main_rg.name
  resource_group_name      = "LabResourceGroup"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
    owner = "rafal"
  }
}

resource "azurerm_storage_account" "zpalca" {
  account_replication_type = "RAGRS"
  account_tier = "Standard"
  location = "East US"
  name = var.name
  resource_group_name = azurerm_resource_group.main_rg.name
  tags = {
    "owner" = "rafal2"
  }
}

resource "azurerm_resource_group" "main_rg" {
  name = "LabResourceGroup"
  location = "westeurope"
}

resource "azurerm_redis_cache" "redis" {

  name                = "redis-345sdfs"

  location            = azurerm_resource_group.main_rg.location

  resource_group_name = azurerm_resource_group.main_rg.name

  capacity            = 2

  family              = "P"

  sku_name            = "Premium"

  enable_non_ssl_port = false

  minimum_tls_version = "1.2"

  subnet_id           = azurerm_subnet.subnet-redis.id



  redis_configuration {

  }

}

resource "azurerm_subnet" "subnet-redis" {

  name                 = "redis-vnet"

  resource_group_name  = azurerm_resource_group.main_rg.name

  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes     = ["10.0.3.0/24"]

}
