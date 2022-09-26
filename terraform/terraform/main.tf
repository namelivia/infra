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
  }
}

provider "aws" {
  region = "eu-west-3"
  shared_credentials_file = var.aws_credentials_file
}

provider "digitalocean" {
  token = var.do_token
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

resource "digitalocean_domain" "namelivia" {
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
