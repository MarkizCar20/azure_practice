# resource "azurerm_resource_group" "rg" {
#   name = "keycloak-project-rg"
#   location = var.location
# } already created for project purposes

module "network" {
    source = "./modules/network"
    vnet_name = "keycloak_vnet"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["10.0.0.0/16"]
    subnet_name = "keycloak-subnet"
    subnet_prefixes = ["10.0.1.0/24"]
    nsg_name = "keycloak-nsg"
    # bastion_prefixes = ["10.0.2.0/27"]
    # bastion_subnet_name = "AzureBastionSubnet"
}

module "compute" {
  source = "./modules/compute"
  vm_name = "keycloak-vm"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_size = "Standard_DS1_v2"
  admin_username = "markomijailovic"
  subnet_id = module.network.subnet_id
  depends_on = [ module.network ]
  vm_public_ip = module.network.keycloack_vm_public_ip
  network_security_group_id = module.network.nsg_id
  ssh_public_key = var.ssh_public_key
  # bastion_name = "my-bastion"
  # bastion_subnet_id = module.network.bastion_subnet_id
  # bastion_public_ip_id = module.network.bastion_public_ip_id
}