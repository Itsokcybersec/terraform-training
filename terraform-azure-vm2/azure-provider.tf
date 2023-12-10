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
  client_id = "10fbd869-4639-431c-b32d-c9955968ebe3"
  client_secret = "7jq8Q~g1JPBgh9LchUImnpf9f4KZC79QVjf1dbKL"
  subscription_id = "49c5a856-c1c1-48f6-8155-1becd64d313b"
  tenant_id = "155d58cf-f7ff-4d29-8bf2-32288b3d6b54"
  features {}
}