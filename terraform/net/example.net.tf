resource "cloudflare_record" "example_net" {
  zone_id  = var.cloudflare_zone_id
  name     = "terraform-net"
  type     = "A"
  value    = "192.1.2.3"
  ttl      = 3600
}
