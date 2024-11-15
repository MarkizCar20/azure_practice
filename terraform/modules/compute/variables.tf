variable "vm_name" {
  description = "The name of the virtual machine"
  type = string
}

variable "location" {
  description = "Azure location for deployment"
  type = string
}

variable "resource_group_name" {
  description = "Resource group name for the VM"
  type = string
}

variable "vm_size" {
  description = "Size of the VM instance"
  type = string
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID from the network module"
  type = string
}

variable "vm_public_ip" {
  description = "Public IP address for the keycloak VM instance"
  type = string
}

# variable "bastion_name" {
#   description = "Name of the Azure Bastion Host"
#   type = string
#   default = "bastion-host"
# }

# variable "bastion_public_ip_id" {
#   description = "ID of the public IP for the Azure Bastion host"
# }

# variable "bastion_subnet_id" {
#   description = "ID of the subnet for the Azure Bastion Host"
#   type = string
# }