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