resource "azurerm_resource_group" "lab_rg" {
  name     = "${var.environment}-rg"
  location = var.location
}