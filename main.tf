terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0" 
    }
  }
  cloud {
    organization = "test11032023"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

module "securestorage" {
  source               = "app.terraform.io/test11032023/securestorage/azurerm"
  version              = "1.0.0"
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = azurerm_resource_group.rg.name
  environment          = "Production"
  location             = azurerm_resource_group.rg.location
}

resource "azurerm_resource_group" "rg" {
  name     = "813-41a00029-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}