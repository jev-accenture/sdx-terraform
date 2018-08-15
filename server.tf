resource "openstack_compute_keypair_v2" "keypair" {
    name = "${var.name_prefix}-keypair"
    public_key = "${file("${var.ssh_key_file}.pub")}"
}

resource "openstack_compute_instance_v2" "server" {
  name        = "${var.name_prefix}-server"
  image_name  = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.keypair.name}"
  security_groups = ["${openstack_compute_secgroup_v2.private_secgroup.name}"]

  network {
    uuid = "${openstack_networking_network_v2.private_network.id}"
  }
}

resource "openstack_compute_secgroup_v2" "private_secgroup" {
  name        = "${var.name_prefix}-private_secgroup"
  description = "Securitu group for ${var.name_prefix} servers"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 8080
    to_port     = 8080
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

