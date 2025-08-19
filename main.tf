terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {
    organization = "MyOrf"

    workspaces {
      name = "Hands-On_with_Terraform_on_Azure"
    }
  }

}
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
}
resource "azurerm_resource_group" "rg" {
  name     = "813-fff656f2-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}
module "securestorage" {
  source               = "app.terraform.io/MyOrf/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "strgzzz0000"
}

