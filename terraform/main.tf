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
}