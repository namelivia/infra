terraform {
  required_version = ">= 1.0.11"
}

module "uptimerobot_alerts" {
  source = "github.com/namelivia/terraform-uptimerobot"
  api_key = var.uptimerobot_api_key
  monitors = var.uptimerobot_monitors
}
