resource "openstack_networking_network_v2" "network" {
  name                  = "example_network"
  admin_state_up        = "true"
  port_security_enabled = true
}

resource "openstack_networking_subnet_v2" "subnet" {
  name       = "Example subnet"
  network_id = openstack_networking_network_v2.network.id
  cidr       = "10.69.69.0/24"
  ip_version = 4
}

resource "openstack_networking_router_v2" "router" {
  name                = "router"
  external_network_id = "14bfae93-4645-4db5-81a3-d62e8c71f22f"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}

resource "openstack_networking_floatingip_v2" "fip" {
  pool = "provider"
}
