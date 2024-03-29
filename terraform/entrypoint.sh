#!/bin/bash
set -eo pipefail
cd terraform
terraform init
terraform plan -var-file="/vars/variables.tfvars" -out /tmp/plan
terraform apply -var-file="/vars/variables.tfvars"
