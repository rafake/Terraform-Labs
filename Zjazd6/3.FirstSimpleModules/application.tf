resource "azurerm_resource_group" "app-rg" {
  location = "westeurope"
  name = "moja grupa raf"
}

module "appserviceplan" {
  source = "./modules/appservice"
  name = "mojaappserviceplaneraf"
  rg-name = azurerm_resource_group.app-rg.name
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.app-rg.location
  resource_group_name = azurerm_resource_group.app-rg.name
  app_service_plan_id = module.appserviceplan.idofplan

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
