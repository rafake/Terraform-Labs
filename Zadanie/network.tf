resource "azurerm_virtual_network" "vnet-rg-raf" {
  name                = "vnet-rg-raf"
  location            = azurerm_resource_group.rg-raf.location
  resource_group_name = azurerm_resource_group.rg-raf.name
  address_space       = ["10.0.0.0/16"]
}

#TODO: mifurm, zmieniam przypisanie subnet'u do sieci spoke i zmieniam adresacje
resource "azurerm_subnet" "vnet-rg-raf-app-service-env-subnet" {
  name                                           = "vnet-rg-raf-app-service-env-subnet"
  virtual_network_name                           = azurerm_virtual_network.vnet-rg-raf.name
  resource_group_name                            = azurerm_resource_group.rg-raf.name
  address_prefixes                               = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "vnet-rg-raf-postgres-subnet" {
  name                                           = "vnet-rg-raf-postgres-subnet"
  virtual_network_name                           = azurerm_virtual_network.vnet-rg-raf.name
  resource_group_name                            = azurerm_resource_group.rg-raf.name
  address_prefixes                               = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "vnet-rg-raf-redis-subnet" {
  name                                           = "vnet-rg-raf-redis-subnet"
  virtual_network_name                           = azurerm_virtual_network.vnet-rg-raf.name
  resource_group_name                            = azurerm_resource_group.rg-raf.name
  address_prefixes                               = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "vnet-rg-raf-lb-vm-subnet" {
  name                                           = "vnet-rg-raf-lb-vm-subnet"
  virtual_network_name                           = azurerm_virtual_network.vnet-rg-raf.name
  resource_group_name                            = azurerm_resource_group.rg-raf.name
  address_prefixes                               = ["10.0.4.0/24"]
}

# #TODO: mifurm, zmieniam przypisanie subnet'u do sieci spoke i zmieniam adresacje
# resource "azurerm_subnet" "vnet-spoke-prd-private-cosmodb-subnet" {
#   name                                           = "cosmosdb-subnet"
#   virtual_network_name                           = azurerm_virtual_network.vnet-spoke-prd.name
#   resource_group_name                            = azurerm_resource_group.netops-prd-spoke.name
#   enforce_private_link_endpoint_network_policies = true
#   enforce_private_link_service_network_policies  = false
#   address_prefixes                               = ["10.100.1.0/24"]
# }

# #TODO: mifurm, zmieniam przypisanie subnet'u do sieci spoke i zmieniam adresacje
# resource "azurerm_subnet" "vnet-spoke-prd-private-function-subnet" {
#   name                                           = "function-subnet"
#   virtual_network_name                           = azurerm_virtual_network.vnet-spoke-prd.name
#   resource_group_name                            = azurerm_resource_group.netops-prd-spoke.name
#   enforce_private_link_endpoint_network_policies = true
#   enforce_private_link_service_network_policies  = false
#   address_prefixes                               = ["10.100.2.0/24"]
# }

# #TODO: mifurm, zmieniam przypisanie subnet'u do sieci spoke i zmieniam adresacje
# resource "azurerm_subnet" "vnet-spoke-prd-private-vm-subnet" {
#   name                                           = "vm-subnet"
#   virtual_network_name                           = azurerm_virtual_network.vnet-spoke-prd.name
#   resource_group_name                            = azurerm_resource_group.netops-prd-spoke.name
#   enforce_private_link_endpoint_network_policies = true
#   enforce_private_link_service_network_policies  = false
#   address_prefixes                               = ["10.100.3.0/24"]
# }

# #TODO: mifurm, dodaje peering pomiedzy siecia hub and spoke
# resource "azurerm_virtual_network_peering" "vnet-hub-2-vnet-spoke-dev-peering" {
#   name                         = "vnet-hub-2-vnet-spoke-dev-peering"
#   resource_group_name          = azurerm_resource_group.netops-prd-hub.name
#   virtual_network_name         = azurerm_virtual_network.vnet-hub.name
#   remote_virtual_network_id    = azurerm_virtual_network.vnet-spoke-dev.id
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   allow_virtual_network_access = true
# }

# #TODO: mifurm, dodaje peering pomiedzy siecia hub and spoke
# resource "azurerm_virtual_network_peering" "vnet-spoke-dev-2-vnet-hub-peering" {
#   name                         = "vnet-spoke-dev-2-vnet-hub-peering"
#   resource_group_name          = azurerm_resource_group.netops-dev-spoke.name
#   virtual_network_name         = azurerm_virtual_network.vnet-spoke-dev.name
#   remote_virtual_network_id    = azurerm_virtual_network.vnet-hub.id
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   allow_virtual_network_access = true
# }

# #TODO: mifurm, dodaje peering pomiedzy siecia hub and spoke
# resource "azurerm_virtual_network_peering" "vnet-hub-2-vnet-spoke-prd-peering" {
#   name                         = "vnet-hub-2-vnet-spoke-prd-peering"
#   resource_group_name          = azurerm_resource_group.netops-prd-hub.name
#   virtual_network_name         = azurerm_virtual_network.vnet-hub.name
#   remote_virtual_network_id    = azurerm_virtual_network.vnet-spoke-prd.id
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   allow_virtual_network_access = true
# }

# #TODO: mifurm, dodaje peering pomiedzy siecia hub and spoke
# resource "azurerm_virtual_network_peering" "vnet-spoke-prd-2-vnet-hub-peering" {
#   name                         = "vnet-spoke-prd-2-vnet-hub-peering"
#   resource_group_name          = azurerm_resource_group.netops-prd-spoke.name
#   virtual_network_name         = azurerm_virtual_network.vnet-spoke-prd.name
#   remote_virtual_network_id    = azurerm_virtual_network.vnet-hub.id
#   allow_forwarded_traffic      = true
#   allow_gateway_transit        = false
#   use_remote_gateways          = false
#   allow_virtual_network_access = true
# }