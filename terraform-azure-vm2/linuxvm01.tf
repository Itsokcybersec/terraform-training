variable "vmsize" {
  type = string
  default = "Standard_B2s"  
}

resource "azurerm_linux_virtual_machine" "linuxvm01" {
  resource_group_name  = azurerm_resource_group.lab_vm_rg.name
  admin_password = "0b&!d05959905"
  admin_username = "admin"
  location = azurerm_resource_group.lab_vm_rg.location
  size = var.vmsize
  network_interface_ids = [
    azurerm_network_interface.vm01_nic01
  ]
}