terraform {
  required_version = ">= 1.0.11"
}

module "digitalocean_droplet" {
  source = "github.com/namelivia/terraform-droplet"
  do_token = var.do_token
  ssh_key = var.ssh_key
}

module "ec2_instances" {
  source = "github.com/namelivia/terraform-ec2"
  shared_credentials_file = var.aws_credentials_file
  ssh_key = var.ssh_key
}

module "lightsail_instances" {
  source = "github.com/namelivia/terraform-lightsail"
  shared_credentials_file = var.aws_credentials_file
  ssh_key = var.ssh_key
}

module "azure_instances" {
  source = "github.com/namelivia/terraform-azure"
  subscription_id = var.azure_subscription_id
  client_id = var.azure_client_id
  client_secret = var.azure_client_secret
  tenant_id = var.azure_tenant_id
  ssh_key = var.ssh_key
}

module "google_instances" {
  source = "github.com/namelivia/terraform-google"
  google_credentials_file = var.google_credentials_file
  ssh_key = var.ssh_key
}

module "digitalocean_dns" {
  source = "github.com/namelivia/terraform-dns"
  domain_name = var.domain_name
  default_ttl = "3600"
  do_token = var.do_token
  a_records = var.dns_records
  host_ips = {
    #"azure_vm" = module.azure_instances.ip
    "azure_vm" = "pending"
    "google_vm" = module.google_instances.ip
    "ec2_instance" = module.ec2_instances.ip
    "digitalocean_droplet" = module.digitalocean_droplet.ip
    "lightsail_vm" = module.lightsail_instances.ip
  }
}

module "uptimerobot_alerts" {
  source = "github.com/namelivia/terraform-uptimerobot"
  api_key = var.uptimerobot_api_key
  monitors = var.uptimerobot_monitors
}
