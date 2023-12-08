  locals {
    common_tags = {
      env = "${var.environment}:${local.location_shortened[var.build_region]}"
      owner = var.owner
      deployment = var.deployment
      department = var.department
      location = var.location
    }
  
    location_shortened = {
      canada-east = "caeast",
      canada-central = "cacentral",
      us-central = "centralus",
      us-east = "eastus",
      us-east-2 = "eastus2",
      us-west = "westus",
      us-west-2 = "westus2",
      us-west-3 = "westus3"
    }
}