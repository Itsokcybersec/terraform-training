#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
resource "azurerm_subnet" "lab_hub_subnet" {
  name                 = "${var.environment}-hub-subnet"
  resource_group_name  = azurerm_resource_group.lab_rg.name
  virtual_network_name = azurerm_virtual_network.lab_main_vnet.name
  address_prefixes     = ["10.90.1.0/24"]
}

resource "azurerm_subnet" "lab_main_subnet" {
  name                 = "${var.environment}-main-subnet"
  resource_group_name  = azurerm_resource_group.lab_rg.name
  virtual_network_name = azurerm_virtual_network.lab_main_vnet.name
  address_prefixes     = ["10.90.2.0/24"]
}