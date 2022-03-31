resource "openstack_dns_zone_v2" "example_zone" {
  name        = "example.corp."
  email       = "user@example.com"
  description = "example zone"
  ttl         = 6000
  type        = "PRIMARY"
}

resource "openstack_dns_recordset_v2" "example_recordset" {
  zone_id     = openstack_dns_zone_v2.example_zone.id
  name        = "example.corp."
  description = "Example web frontend"
  ttl         = 3000
  type        = "A"
  records     = [openstack_networking_floatingip_v2.fip.address]
}
