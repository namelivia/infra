terraform {
  required_version = ">= 1.0.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    hcloud = {
      source = "hetznercloud/hcloud"
      version = "=1.48.1"
    }
  }
}

//Providers

provider "aws" {
  region = "eu-west-3"
  shared_credentials_file = var.aws_credentials_file
}

provider "digitalocean" {
  token = var.do_token
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "azurerm" {
  features{}

  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
}

provider "google" {
  credentials = var.google_credentials_file
  project = "peak-ranger-267808"
  region  = "europ-west1"
  zone    = "europe-west1-b"
}

//Bastion
module "bastion_instance" {
  source = "github.com/namelivia/terraform-bastion"
  instance_name = "Bastion"
  key_name = var.bastion_key_name
}

module "bastion" {
  source = "github.com/namelivia/terraform-hetzner"
  server_name = "bastion"
  server_type = "cx11"
  ssh_key_id = module.hetzner_key.ssh_key_id
}

//Instances
module "hetzner_key" {
  source = "github.com/namelivia/terraform-hetzner-key"
  key_name = "hetzner"
  ssh_key = var.ssh_key
}

module "hetzner_server" {
  source = "github.com/namelivia/terraform-hetzner"
  server_name = "hetzner"
  server_type = "cx22"
  ssh_key_id = module.hetzner_key.ssh_key_id
}

module "hetzner_server_2" {
  source = "github.com/namelivia/terraform-hetzner"
  server_name = "hetzner2"
  server_type = "cx11"
  ssh_key_id = module.hetzner_key.ssh_key_id
}

module "hetzner_server_3" {
  source = "github.com/namelivia/terraform-hetzner"
  server_name = "hetzner3"
  server_type = "cx22"
  ssh_key_id = module.hetzner_key.ssh_key_id
}

//DNS Records
resource "digitalocean_domain" "domain" {
  name = var.domain_name
}

module "digitalocean_dns" {
  source = "github.com/namelivia/terraform-dns"
  default_ttl = "3600"
  domain_name = var.domain_name
  a_records = var.dns_records
  host_ips = {
    "bastion" = module.bastion_instance.ip
    "bastion2" = module.bastion.ip
  }
}

//Backup bucket
module "backup_bucket" {
  source = "github.com/namelivia/terraform-backup-bucket"
  bucket_name = var.backup_bucket_name
}

output "backup_access_key" {
  value = module.backup_bucket.access_key
}

output "backup_access_secret" {
  value = nonsensitive(module.backup_bucket.secret_key)
}

output "backup_bucket_url" {
  value = module.backup_bucket.bucket_url
}

//Hosts file
locals {
  hosts_file = templatefile("/terraform/hosts.tpl", {
    bastion_instance_ip = "${module.bastion_instance.ip}"
    bastion_2_instance_ip = "${module.bastion.ip}"
    hetzner_server_ip = "${module.hetzner_server.ip}"
    hetzner_server_2_ip = "${module.hetzner_server_2.ip}"
    hetzner_server_3_ip = "${module.hetzner_server_3.ip}"
  })
}

resource "local_file" "hosts" {
  content = local.hosts_file
  filename = "/terraform/hosts"
}
