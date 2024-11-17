variable "location" {
  description = "Azure region for resource deployment"
  type = string
  default = "centralus"
}

variable "resource_group_name" {
  description = "The name of the resource group to be created"
  type = string
  default = "keycloak-project-rg"
}

variable "client_id" {
  description = "Client ID of the Service Principal"
  type = string
  sensitive = true
}

variable "client_secret" {
  description = "Client Secret of the Service Principal"
  type = string
  sensitive = true
}

variable "subscription_id" {
  description = "Subscription ID for Azure"
  type = string
}

variable "tenant_id" {
  description = "Tenant ID for Azure"
  type = string
}

variable "ssh_public_key" {
  description = "Public key for SSH access"
  type = string
}