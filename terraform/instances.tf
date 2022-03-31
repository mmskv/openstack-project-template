resource "openstack_compute_instance_v2" "web1" {
  name        = "web1"
  image_name  = "Arch Linux"
  flavor_name = "m2s.micro"
  user_data   = file("${path.module}/../authorized_keys.yaml")
  network {
    uuid = openstack_networking_network_v2.network.id
  }
  security_groups = ["default"]
}

resource "openstack_compute_floatingip_associate_v2" "fip" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  instance_id = openstack_compute_instance_v2.web1.id
}
