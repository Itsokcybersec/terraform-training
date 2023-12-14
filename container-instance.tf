#Azure container instance = ACI
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group
resource "azurerm_container_group" "lab_container" {
  name                = "${var.environment}-nginx-aci"
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "nginx"
    image  = "docker.io/nginx:1.23latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  tags = {
    environment = "lab"
  }
}