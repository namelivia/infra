variable "do_token" {
  type = string
  description = "Token for Digital Ocean"
}

variable "ssh_key" {
  type = string
  description = "SSH Key to access the instance"
}

variable "azure_client_secret" {
  type = string
}

variable "azure_subscription_id" {
  type = string
}

variable "azure_client_id" {
  type = string
}

variable "azure_tenant_id" {
  type = string
}

variable "aws_credentials_file" {
  type = string
  description = "Path for the file containing aws credentials"
}

variable "google_credentials_file" {
  type = string
  description = "Path for the file containing google credentials"
}

variable "uptimerobot_api_key" {
  type = string
  description = "Your api key for uptimerobot"
}

variable "uptimerobot_monitors" {
  description = "List of uptimerobot monitors"
  type = map(object({
    name = string
    url = string
    keyword = string
  }))
}

variable "domain_name" {
  type = string
  description = "Your domain name"
}

variable "dns_records" {
  description = "List of DNS A type records to be added"
  type = map(object({
    name = string
    host = string
  }))
}
