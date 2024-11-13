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