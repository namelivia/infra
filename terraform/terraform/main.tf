terraform {
  required_version = ">= 1.0.11"
}

module "deployer_key" {
  source = "github.com/namelivia/terraform-key"
  shared_credentials_file = var.aws_credentials_file
  ssh_key = var.ssh_key
  key_name = "testing-key"
}
