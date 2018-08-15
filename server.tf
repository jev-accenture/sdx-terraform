resource "openstack_compute_keypair_v2" "keypair" {
    name = "${var.name_prefix}-keypair"
    public_key = "${file("${var.ssh_key_file}.pub")}"
}

resource "openstack_compute_instance_v2" "server" {
  name        = "${var.name_prefix}-server"
  image_name  = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.keypair.name}"

  network {
    uuid = "${openstack_networking_network_v2.private_network.id}"
  }
}

