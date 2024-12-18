resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = var.address_space
}

resource "azurerm_subnet" "subnet" {
  name = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_prefixes
}

# resource "azurerm_subnet" "bastion_subnet" {
#   name = var.bastion_subnet_name
#   resource_group_name = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes = var.bastion_prefixes
# }

# resource "azurerm_public_ip" "bastion_public_ip" {
#   name = "bastion-public-ip"
#   location = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method = "Static"
#   sku = "Standard" #this is required for Bastion hosts?
# }

resource "azurerm_public_ip" "vm_instance_public_ip" {
  name = "keycloak-vm-public-ip"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
}

resource "azurerm_network_security_group" "nsg" {
  name = var.nsg_name
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_http" {
  name = "allowHTTP"
  priority = 100
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  destination_port_ranges = [ "80", "8080", "8443"]
  source_address_prefix = "*"
  destination_address_prefix = "*"
  source_port_range = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name = var.resource_group_name
}

# resource "azurerm_network_security_rule" "allow_keycloak_port" {
#   name = "allowKeyCloakPort"
#   priority = 200
#   direction = "Inbound"
#   access = "Allow"
#   protocol = "Tcp"
#   source_address_prefix = "*"
#   destination_address_prefix = "*"
#   source_port_range = "*"
#   network_security_group_name = azurerm_network_security_group.nsg.name
#   resource_group_name = var.resource_group_name
#   destination_port_ranges = [ "8080", "8443"]
# }

resource "azurerm_network_security_rule" "allow_ssh" {
  name = "allowSSH"
  priority = 300
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefix = "*"
  destination_address_prefix = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name = var.resource_group_name
}