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
    # resource_group_name  = "PROD-RG" 
    # storage_account_name = "PROD-STORAGE"
    # container_name       = "tfstate"
    # key                  = "iam-vending-machine.tfstate"
  }
}

provider "azurerm" {
  features {}
  # subscription_id = "REPLACE WITH SUBSCRIPTION ID OR USE AZ LOGIN"
  resource_provider_registrations = "none"
}

provider "azuread" {}

