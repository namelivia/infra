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

/*
//This is going to be the new key
module "deployer_key" {
  source = "github.com/namelivia/terraform-key"
  ssh_key = var.ssh_key
  key_name = "new-deployer-key"
}

//And this is going to be the new bastion
module "bastion_instances" {
  source = "github.com/namelivia/terraform-lightsail"
  instance_name = "bastion"
  ssh_key = var.ssh_key
}
*/

//Instances
module "digitalocean_droplet" {
  source = "github.com/namelivia/terraform-droplet"
  ssh_key = var.ssh_key
}

module "ec2_instance" {
  source = "github.com/namelivia/terraform-ec2"
  ssh_key = var.ssh_key
}

module "lightsail_instance" {
  source = "github.com/namelivia/terraform-lightsail"
  instance_name = "lightsail"
  ssh_key = var.ssh_key
}

module "azure_instance" {
  source = "github.com/namelivia/terraform-azure"
  ssh_key = var.ssh_key
}

module "google_instance" {
  source = "github.com/namelivia/terraform-google"
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
    //"bastion" = module.bastion_instances.ip
    "old_bastion" = var.old_bastion_ip
  }
}

locals {
  hosts_file = templatefile("/terraform/hosts.tpl", {
    azure_vm_ip = "${module.azure_instance.ip}"
    google_instance_ip = "${module.google_instance.ip}"
    ec2_instance_ip = "${module.ec2_instance.ip}"
    digitalocean_droplet_ip = "${module.digitalocean_droplet.ip}"
    lightsail_instance_ip = "${module.lightsail_instance.ip}"
  })
}

resource "local_file" "hosts" {
  content = local.hosts_file
  filename = "/terraform/hosts"
}
