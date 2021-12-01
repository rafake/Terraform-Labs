terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.77.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sub007state"
    storage_account_name = "sub007statestorage"
    container_name       = "contener007"
    key                  = "contener007.tfstate"
    access_key           = "ce31iHPBUDXiirNzjKeVkMb9BgR4Q3WJxamju5R1aFnEdWeE2GbZ+/m4alziAVy9PCnR9bpu2V7ZyXM2yInkBw==" # Może być przetrzymywany przy pomocy zmiennej środowiskowej ARM_ACCESS_KEY
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  subscription_id = "53d60844-4bdb-410f-a330-2fa78aa5ca81"
}

# Configure the Azure Active Directory Provider
provider "azuread" {
  tenant_id = "16dd9b56-84a8-4b26-b800-741b14debe2f"
}