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

variable "build_region" {
  type = string
  description = "Azure Build Region"
  default = "canada-east"
}

variable "owner" {
  type = string
  description = "Owner tag for resource creation"
  default = "javarini"
}

variable "deployment" {
  type = string
  description = "Deployment Mode"
  default = "terraform"
}

variable "department" {
  type = string
  description = "Deployment Team"
  default = "DevOps"
}