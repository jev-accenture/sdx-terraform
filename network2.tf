resource "openstack_networking_network_v2" "private_network2" {
  name           = "${var.name_prefix}-private_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "private_subnet2" {
  name       = "${var.name_prefix}-private_subnet"
  network_id = "${openstack_networking_network_v2.private_network2.id}"
  cidr       = "${var.private_network_cidr2}"
  ip_version = 4
}

