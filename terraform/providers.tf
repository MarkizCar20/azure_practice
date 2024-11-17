terraform {
  backend "azurerm" {
    resource_group_name = var.resource_group_name
    storage_account_name = "terraformstatekcpractice"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
  client_id = var.client_id
  client_secret = var.client_secret
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
}