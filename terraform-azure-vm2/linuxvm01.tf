variable "vmsize" {
  type = string
  default = "Standard_B2s"  
}

#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
resource "azurerm_linux_virtual_machine" "linuxvm01" {
  name     = "linuxvm01"  
  resource_group_name  = azurerm_resource_group.lab_vm_rg.name
  admin_password = "abc,123!"
  admin_username = "admin"

  location = azurerm_resource_group.lab_vm_rg.location
  size = var.vmsize

  network_interface_ids = [
    azurerm_network_interface.vm01_nic01
  ]


  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}