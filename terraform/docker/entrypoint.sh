#!/bin/bash
# Disable strict host key checking on GitHub
cd terraform && terraform init && terraform plan -out /tmp/plan -var-file="variables.tfvars"
#&& terraform apply /tmp/plan
