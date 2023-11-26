#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_resource_group" "lab_rg" {
  name     = "${var.environment}-rg"
  location = var.location
}

resource "azurerm_network_security_group" "lab_main_nsg" {
  name                = "${var.environment}-main-nsg"
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name
}

resource "azurerm_virtual_network" "lab_main_vnet" {
  name                = "${var.environment}-main-vnet"
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name
  address_space       = ["10.40.0.0/16"]
  dns_servers         = ["10.40.0.4", "10.40.0.5"]

  subnet {
    name           = "${var.environment}-hub-subnet"
    address_prefix = "10.40.1.0/24"
  }

  subnet {
    name           = "${var.environment}-main-subnet"
    address_prefix = "10.40.2.0/24"
    security_group = azurerm_network_security_group.lab_main_nsg.id
  }

  tags = local.common_tags
}  