variable "name_prefix" {
  type = "string"
  default = "dev"
}

variable "count" {
  type = "string"
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

variable "public_network" {
  type = "string"
}

variable "public_ip_pool" {
  type = "string"
}

