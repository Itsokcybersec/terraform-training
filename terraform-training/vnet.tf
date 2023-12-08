#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "lab_main_vnet" {
  name                = "${var.environment}-main-vnet"
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name
  address_space       = ["10.90.0.0/16"]
  dns_servers         = ["8.8.8.8", "1.1.1.1"]

  tags = local.common_tags
}  

resource "azurerm_network_security_group" "lab_main_nsg" {
  name                = "${var.environment}-main-nsg"
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name
}