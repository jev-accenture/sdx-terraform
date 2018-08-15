
output "private_ip" {
    value = "${openstack_compute_instance_v2.server.access_ip_v4}"
}

