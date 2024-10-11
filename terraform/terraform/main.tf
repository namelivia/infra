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

    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.0.0"
    }

    google = {
      source = "hashicorp/google"
      version = "=4.37.0"
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

//Instances
module "digitalocean_droplet" {
  source = "github.com/namelivia/terraform-droplet"
  name = "namelivia"
  key_name = "deployer-key"
  ssh_key = var.ssh_key
}

module "lightsail_instance" {
  source = "github.com/namelivia/terraform-lightsail"
  instance_name = "lightsail"
  ssh_key = var.ssh_key
}

module "lightsail_secondary_instance" {
  source = "github.com/namelivia/terraform-lightsail"
  instance_name = "azure"
  ssh_key = var.ssh_key
}

module "hetzner_server" {
  source = "github.com/namelivia/terraform-hetzner"
  server_name = "hetzner"
  ssh_key = var.ssh_key
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
    azure_vm_ip = "${module.lightsail_secondary_instance.ip}"
    bastion_instance_ip = "${module.bastion_instance.ip}"
    digitalocean_droplet_ip = "${module.digitalocean_droplet.ip}"
    lightsail_instance_ip = "${module.lightsail_instance.ip}"
    hetzner_server_ip = "${module.hetzner_server.ip}"
  })
}

resource "local_file" "hosts" {
  content = local.hosts_file
  filename = "/terraform/hosts"
}
