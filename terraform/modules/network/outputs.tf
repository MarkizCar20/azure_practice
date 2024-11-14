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