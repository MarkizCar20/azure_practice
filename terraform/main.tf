resource "azurerm_resource_group" "rg" {
  name = "keycloak-project-rg"
  location = var.location
}

module "network" {
    source = "./modules/network"
    vnet_name = "keycloak_vnet"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["10.0.0.0/16"]
    subnet_name = "keycloak-subnet"
    subnet_prefixes = ["10.0.1.0/24"]
    bastion_prefixes = ["10.0.2.0/27"]
    bastion_subnet_name = "AzureBastionSubnet"
    nsg_name = "keycloak-nsg"
}

module "compute" {
  source = "./modules/compute"
  vm_name = "keycloak-vm"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_size = "Standard_DS1_v2"
  admin_username = "mmijailovic"
  subnet_id = module.network.subnet_id

  bastion_name = "my-bastion"
  bastion_subnet_id = module.network.bastion_subnet_id
  bastion_public_ip_id = module.network.bastion_public_ip_id

  depends_on = [ module.network ]
}