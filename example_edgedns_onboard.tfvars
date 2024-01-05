# Akamai Provider 

edgerc_location = "~/.edgerc"
edgerc_section  = "tf"

# Common

group_name = "My Group"

# Zone and required records

dns_zone = {
  name    = "example.com"
  comment = "New Zone"
}

ns_servers = ["a1-34.akam.net.", "a13-65.akam.net.", "a14-66.akam.net.", "a20-67.akam.net.", "a26-64.akam.net.", "a7-65.akam.net."]

soa_email = "noreply.example.com"

# Other records 

dns_zam = {
  name   = "example.com"
  target = "example.com.edgesuite.net"
}

additional_records = {
  "record1" = {
    recordType = "MX"
    ttl        = 60
    target     = "10 email.example.com"
    name       = "example.com"
  },
  "record2" = {
    recordType = "A"
    ttl        = 60
    target     = "172.233.190.92"
    name       = "mail.example.com"
  },
  "record3" = {
    recordType = "AAAA"
    ttl        = 60
    target     = "2a01:7e04::f03c:94ff:fe60:7702"
    name       = "mail.example.com"
  }
}