output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
  description = "The ID of the subnet for the virtual network"
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "bastion_subnet_id" {
  value = azurerm_subnet.bastion_subnet.id
  description = "ID of the Azure Bastion subnet"
}

output "bastion_public_ip_id" {
  value = azurerm_public_ip.bastion_public_ip.id
  description = "ID of the Azure Bastion public IP"
}