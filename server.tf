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

resource "aws_security_group" "server_fw" {
  vpc_id = "${data.aws_vpc.private_cloud.id}"
  name = "${var.name_prefix}-server_fw"

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "tcp"
    from_port = 8080
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "icmp"
    from_port = -1
    to_port   = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${var.name_prefix}-server_fw"
    )
  )}"
}
