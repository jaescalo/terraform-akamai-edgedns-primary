# Akamai Provider 

edgerc_location = "~/.edgerc"
edgerc_section  = "tf-tcw"

# Common

group_name = "jaescalo"

# Zone and required records

dns_zone = {
  name    = "jaescalo3.com"
  comment = "New Zone"
}

ns_servers = ["a1-34.akam.net.", "a13-65.akam.net.", "a14-66.akam.net.", "a20-67.akam.net.", "a26-64.akam.net.", "a7-65.akam.net."]

soa_email = "noreply.akamai.com"

# Other records 

dns_zam = {
  name   = "jaescalo2.com"
  target = "wingmanstrums.com.edgesuite.net"
}

additional_records = {
  "record1" = {
    recordType = "MX"
    ttl        = 60
    target     = "10 ak-mail.jaescalo2.com"
    name       = "jaescalo2.com"
  },
  "record2" = {
    recordType = "A"
    ttl        = 60
    target     = "172.233.190.92"
    name       = "ak-mail.jaescalo2.com"
  },
  "record3" = {
    recordType = "AAAA"
    ttl        = 60
    target     = "2a01:7e04::f03c:94ff:fe60:7702"
    name       = "ak-mail.jaescalo2.com"
  }
}