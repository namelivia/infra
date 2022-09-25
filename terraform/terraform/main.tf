terraform {
  required_version = ">= 1.0.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  shared_credentials_file = "${var.aws_credentials_file}"
}

//This is going to be the new key
/*
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
