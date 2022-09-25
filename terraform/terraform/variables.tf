variable "ssh_key" {
  type = string
  description = "SSH Key to access the instance"
}

variable "aws_credentials_file" {
  type = string
  description = "Path for the file containing aws credentials"
}
