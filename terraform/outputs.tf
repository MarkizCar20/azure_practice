output "resource_group_name" {
  value = azurerm_resource_group.rg.name
  description = "The name of the created resource group"
}

output "vnet_id" {
  value = module.network.vnet_id
  description = "The ID of the Vritual Network created by the network module"
}

output "subnet_id" {
  value = module.network.subnet_id
  description = "The ID of the Subnet created by the network module"
}

output "nsg_id" {
  value = module.network.nsg_id
  description = "The ID of the Network Security Group created by the network module."
}

output "vm_public_ip" {
  value = module.compute.vm_public_ip
  description = "The public IP address of the virtual machine created by the compute module"
}

output "nic_id" {
  value = module.compute.nic_id
  description = "The network interface ID of the virtual machine"
}