variable "address_space" {
  type = list(string)
  default = ["10.80.0.0/16"]

}

variable "environment" {
  type = string
  description = "Environment Name"
  default = "lab"
}

variable "location" {
  type = string
  description = "Azure Location"
  default = "canadaeast"
}

resource "azurerm_virtual_network" "lab_vm_vnet" {
  name                = "${var.environment}-vm-vnet"
  location            = azurerm_resource_group.lab_vm_rg.location
  resource_group_name = azurerm_resource_group.lab_vm_rg.name
  address_space       = ["10.80.0.0/16"]
  dns_servers         = ["8.8.8.8", "1.1.1.1"]

#  tags = local.common_tags
}  

resource "azurerm_subnet" "lab_vm_subnet" {
  name                 = "${var.environment}-vm-subnet"
  resource_group_name  = azurerm_resource_group.lab_vm_rg.name
  virtual_network_name = azurerm_virtual_network.lab_vm_vnet.name
  address_prefixes     = ["10.80.1.0/24"]
}

resource "azurerm_resource_group" "lab_vm_rg" {
  name     = "${var.environment}-vm-rg"
  location = var.location
}

output "output_vnet_name" {
  value = azurerm_virtual_network.lab_vm_vnet.name  
}

output "output_subnet_id" {
  value = azurerm_subnet.lab_vm_subnet.id  
}

output "output_vnet_rg_name" {
  value = azurerm_resource_group.lab_vm_rg.name  
}