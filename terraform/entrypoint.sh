#!/bin/bash
cd terraform && terraform init && terraform plan -out /tmp/plan -var-file="/vars/variables.tfvars" && terraform apply /tmp/plan
