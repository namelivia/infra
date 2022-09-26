variable "ssh_key" {
  type = string
  description = "SSH Key to access the instance"
}

variable "aws_credentials_file" {
  type = string
  description = "Path for the file containing aws credentials"
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
