data "openstack_networking_network_v2" "public_network" {
    name = "${var.public_network}"
}

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

resource "openstack_networking_router_v2" "private_router" {
  name                = "${var.name_prefix}-private_router"
  admin_state_up      = true
  external_network_id = "${data.openstack_networking_network_v2.public_network.id}"
}

resource "openstack_networking_router_interface_v2" "terraform" {
  router_id = "${openstack_networking_router_v2.private_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.private_subnet.id}"
}

resource "openstack_networking_floatingip_v2" "public_ip" {
  pool       = "${var.public_ip_pool}"
  depends_on = ["openstack_networking_router_interface_v2.terraform"]
}

