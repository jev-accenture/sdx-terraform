variable "name_prefix" {
  type = "string"
  default = "dev"
}

variable "image" {
  type = "string"
}

variable "flavor" {
  type = "string"
}

variable "ssh_key_file" {
  type = "string"
}

variable "private_network_cidr" {
  type = "string"
}

