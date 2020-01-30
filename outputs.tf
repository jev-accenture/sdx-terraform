output "default_tags" {
  value = "${local.default_tags}"
}

output "vpc_cird" {
  value = "${data.aws_vpc.private_cloud.cidr_block}"
}

output "availability_zone" {
  value = "${aws_subnet.private_network.availability_zone}"
}

output "server_ami" {
  value = "${data.aws_ami.linux_ami_hvm.id}"
}

output "server_ips" {
  # user: ec2-user
  value = "${aws_instance.server.*.public_ip}"
}

