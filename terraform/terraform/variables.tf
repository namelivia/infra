variable "ssh_key" {
  type = string
  description = "SSH Key to access the instances"
}

variable "aws_credentials_file" {
  type = string
  description = "Path for the file containing aws credentials"
}

variable "google_credentials_file" {
  type = string
  description = "The file containing google cloud credentials"
}

variable "azure_subscription_id" {
  type = string
  description = "Subscription id for Azure"
}

variable "azure_client_id" {
  type = string
  description = "Client id for Azure"
}

variable "azure_client_secret" {
  type = string
  description = "Client secret for Azure"
}

variable "azure_tenant_id" {
  type = string
  description = "Tenant id for Azure"
}

variable "do_token" {
  type = string
  description = "Token for Digital Ocean"
}

variable "domain_name" {
  type = string
  description = "Your domain name"
}

variable "old_bastion_ip" {
  type = string
  description = "The ip for my current bastion"
}

variable "dns_records" {
  description = "List of DNS A type records to be added"
  type = map(object({
    name = string
    host = string
  }))
}

