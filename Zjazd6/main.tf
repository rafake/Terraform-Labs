module "vnet" {
  name = "vnet-dev"
  rg_name = azurerm_resource_group.name
  address_space = ["10.0.0.0/16"]
  dns_servers = ["168.63.129.16"]
}