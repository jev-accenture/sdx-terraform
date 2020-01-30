output "default_tags" {
  value = "${local.default_tags}"
}

output "vpc_cird" {
  value = "${data.aws_vpc.private_cloud.cidr_block}"
}

output "availability_zone" {
  value = "${aws_subnet.private_network.availability_zone}"
}
