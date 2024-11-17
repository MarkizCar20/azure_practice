resource "azurerm_network_interface" "nic" {
  name = "keycloak-nic"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "internal"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.vm_public_ip
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id = azurerm_network_interface.nic.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name = var.vm_name
  resource_group_name = var.resource_group_name
  location = var.location
  size = var.vm_size
  admin_username = var.admin_username
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_ssh_key {
    username = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# resource "azurerm_bastion_host" "bastion" {
#   name = var.bastion_name
#   location = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name = "bastion-ip-config"
#     subnet_id = var.bastion_subnet_id
#     public_ip_address_id = var.bastion_public_ip_id
#   }
# }