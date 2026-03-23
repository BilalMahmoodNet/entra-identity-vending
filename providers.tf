terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "pro-architect-mgmt-rg"
    storage_account_name = "archlabtfstate20419f"
    container_name       = "tfstate"
    key                  = "iam-vending-machine.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "aa14ada3-c48e-4778-aecc-fbdd595f9868"
}

provider "azuread" {}