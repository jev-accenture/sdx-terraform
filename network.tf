resource "openstack_networking_network_v2" "private_network" {
  name           = "${var.name_prefix}-private_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "private_subnet" {
  name       = "${var.name_prefix}-private_subnet"
  network_id = "${openstack_networking_network_v2.private_network.id}"
  cidr       = "${var.private_network_cidr}"
  ip_version = 4
}

