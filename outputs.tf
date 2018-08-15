
output "private_ip" {
    value = "${openstack_compute_instance_v2.server.*.access_ip_v4}"
}

output "public_ip" {
  value = "${openstack_networking_floatingip_v2.public_ip.address}"
}

