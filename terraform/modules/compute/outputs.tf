output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}