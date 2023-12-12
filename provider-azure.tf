# https://registry.terraform.io/providers/hashicorp/azurerm/latest
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.81.0"
    }
  }

  cloud {
    organization = "itsok"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
#    hostname = "app.terraform.io"

    workspaces {   
      name = "terraform-training"
    }
  }
}

provider "azurerm" {
  client_id = var.azure_client_id
  client_secret = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id = var.azure_tenant_id
  features {}
}