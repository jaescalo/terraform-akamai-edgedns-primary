# Onboard DNS Zone to Akamai EdgeDNS as Primary
Onboard a new zone to Akamai EdgeDNS as Primary. Primary zones are managed completely in EdgeDNS.

This EdgeDNS module supports:
* Zone creation with required records: SOA, NS
* ZAM Record (or Top Level Domain record)
* Any additional records (i.e. A, TXT, CNAME, etc)

## Example Usage
See the `example_edgedns_onboard.tfvars` file for variable value examples.

Call the `edgedns-primary` module within your TF code:

```
module "property-ion" {
  source  = "jaescalo/edgedns-primary/akamai"
  version = "1.3.0"

  edgerc_location     = var.edgerc_location
  edgerc_section      = var.edger_section
  group_name          = var.group_name
  dns_zone            = var.dns_zone
  ns_servers          = var.ns_servers
  soa_email           = var.soa_email 
  dns_zam             = var.dns_zam
  additional_records  = var.additional_records
}
```

And pass the tfvars during the plan/apply:

`terraform apply -var-file=example_edgedns_onboard.tfvars`
