
resource "azurerm_app_service_plan" "app-serv-plan" {
  name                = var.name
  location            = "West Europe"
  resource_group_name = var.rg-name

  sku {
    tier = "Standard"
    size = "S0"
  }
}