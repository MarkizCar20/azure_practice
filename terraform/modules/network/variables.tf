variable "vnet_name" {
  type = string
  description = "Name of virtual network"
}

variable "location" {
  type = string
  description = "Azure location"
}

variable "resource_group_name" {
  type = string
  description = "Resource group name for the network"
}

variable "address_space" {
  type = list(string)
  description = "Address space for the virtual network"
}

variable "subnet_name" {
  type = string
  description = "Name of the subnet"
}

variable "subnet_prefixes" {
  type = list(string)
  description = "Address prefix for the subnet"
}


# variable "bastion_prefixes" {
#   type = list(string)
#   description = "Address prefix for bastion"
# }

variable "nsg_name" {
  type = string
  description = "Name of the network security group"
}

# variable "bastion_subnet_name" {
#   type = string
#   description = "Name of Bastion subnet"
# }