resource "google_compute_address" "load_balancer_ip" {
  name = "${var.environment}-load-balancer-ip"
}

provider "cloudflare" {
  version = "~> 2.0"
  api_token = var.cloudflare_settings.api_token
}

resource "cloudflare_record" "main_subdomain" {
  zone_id = var.cloudflare_settings.zone_id
  name    = var.environment
  value   = google_compute_address.load_balancer_ip.address
  type    = "A"
  ttl     = 1
  proxied = true
}

//resource "cloudflare_record" "echoserver_subdomain" {
//  zone_id = var.cloudflare_settings.zone_id
//  name    = "echo-server-${var.environment}"
//  value   = google_compute_address.load_balancer_ip.address
//  type    = "A"
//  ttl     = 1
//  proxied = true
//}