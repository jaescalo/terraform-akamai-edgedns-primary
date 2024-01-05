data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "akamai_dns_zone" "new_zone" {
  contract                 = data.akamai_contract.contract.id
  group                    = data.akamai_contract.contract.group_id
  zone                     = var.dns_zone.name
  type                     = "PRIMARY"
  masters                  = []
  comment                  = var.dns_zone.comment
  sign_and_serve           = false
  sign_and_serve_algorithm = ""
  target                   = ""
  end_customer_id          = ""
}

resource "akamai_dns_record" "zone_NS" {
  zone       = var.dns_zone.name
  name       = var.dns_zone.name
  recordtype = "NS"
  target     = var.ns_servers
  ttl        = 86400

  depends_on = [ akamai_dns_zone.new_zone ]
}

resource "akamai_dns_record" "zone_SOA" {
  zone          = var.dns_zone.name
  email_address = var.soa_email
  expiry        = 604800
  name          = var.dns_zone.name
  name_server   = var.ns_servers[0]
  nxdomain_ttl  = 300
  recordtype    = "SOA"
  refresh       = 3600
  retry         = 600
  target        = []
  ttl           = 86400

  depends_on = [ akamai_dns_zone.new_zone ]
}

resource "akamai_dns_record" "zone_AKAMAICDN" {
  zone       = var.dns_zone.name
  name       = var.dns_zam.name
  recordtype = "AKAMAICDN"
  target     = [var.dns_zam.target]
  ttl        = 20

  depends_on = [ akamai_dns_zone.new_zone ]
}

resource "akamai_dns_record" "zone_dns_records" {

  for_each = var.additional_records

  zone       = var.dns_zone.name
  recordtype = each.value.recordType
  ttl        = each.value.ttl
  target     = [each.value.target]
  name       = each.value.name

  depends_on = [ akamai_dns_zone.new_zone ]
}