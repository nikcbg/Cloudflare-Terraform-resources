resource "cloudflare_record" "sub_example" {
  zone_id  = var.cloudflare_zone_id
  name     = "terraform-sub"
  type     = "A"
  value    = "192.1.2.3"
  ttl      = 3600
}
