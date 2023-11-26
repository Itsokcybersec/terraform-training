# https://registry.terraform.io/providers/hashicorp/azurerm/latest
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.81.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  cloud {
    organization = "itsok"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {   
      tags = ["terraform-training"]
    }
  }
}