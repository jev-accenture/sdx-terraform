data "aws_ami" "linux_ami_hvm" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["${var.image}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "keypair" {
  key_name   = "${var.name_prefix}-key"
  public_key = "${file("${var.ssh_key_file}.pub")}"
}
