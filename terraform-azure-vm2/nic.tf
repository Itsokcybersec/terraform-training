resource "azurerm_network_interface" "vm01_nic01" {
  name                = "${var.environment}-vm01-nic01"
  location            = azurerm_resource_group.lab_vm_rg.location
  resource_group_name = azurerm_resource_group.lab_vm_rg.name
  
  ip_configuration {
    name = "${var.environment}-vm01-nic01-ip01"
    subnet_id = module.vnet.output_subnet_id
    private_ip_address_allocation = "dynamic"
  }

  depends_on = [
    azurerm_resource_group.lab_vm_rg
   ]

}  