#Notifications if a threshold is achive
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription
data "azurerm_subscription" "main" {}

resource "azurerm_monitor_action_group" "lab_monitor_action_group" {
  name                = "${var.environment}-monitor-action-group"
  resource_group_name = azurerm_resource_group.lab_rg.name
  short_name          = "*****#####COSTS ALERT#####*****"
}

resource "azurerm_consumption_budget_subscription" "lab_budget" {
  name            = "${var.environment}-budget"
  subscription_id = data.azurerm_subscription.main.id

  amount     = 10
  time_grain = "Monthly"

  time_period {
    start_date = "2023-12-12T00:00:00Z"
    #end_date   = "2022-07-01T00:00:00Z"
  }

  filter {
    dimension {
      name = "lab-rg"
      values = [
        azurerm_resource_group.lab_rg.name,
      ]
    }

    tag {
      name = "lab-budget-tags"
      values = [
        "Lab",
        "Costs Monitor",
      ]
    }
  }

  notification {
    enabled        = true
    threshold      = 0
    operator       = "GreaterThan"

    contact_emails = [
      "techcanadagroup@gmail.com",
      "lylefeitosa@gmail.com",
    ]
  }

  notification {
    enabled   = true
    threshold = 50.0
    operator  = "EqualTo"

    contact_emails = [
      "techcanadagroup@gmail.com",
      "lylefeitosa@gmail.com",
    ]

    contact_groups = [
      azurerm_monitor_action_group.lab_monitor_action_group.id,
    ]

    contact_roles = [
      "Owner",
    ]
  }

  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = [
      "techcanadagroup@gmail.com",
      "lylefeitosa@gmail.com",
    ]
  }
}
