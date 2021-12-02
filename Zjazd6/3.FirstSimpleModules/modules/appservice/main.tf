
resource "azurerm_app_service_plan" "app-serv-plan" {
  name                = var.name
  location            = module.location.location
  resource_group_name = var.rg-name

  sku {
    tier = "Standard"
    size = "S0"
  }
}

module "location" {
  source = "../location"
  
}