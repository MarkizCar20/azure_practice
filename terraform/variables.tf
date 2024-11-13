variable "location" {
  description = "Azure region for resource deployment"
  type = string
  default = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group to be created"
  type = string
  default = "keycloak-project-rg"
}