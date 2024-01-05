# -------------------------------------------------
# Akamai Provider Variables
# -------------------------------------------------

variable "edgerc_location" {
  description = "Location for the .edgerc file with credentials"
  type        = string
  default     = "~/.edgerc"
}

variable "edgerc_section" {
  description = "Section in the .edgerc file to use"
  type        = string
  default     = "default"
}

# -------------------------------------------------
# Common Variables 
# -------------------------------------------------

variable "group_name" {
  description = "Akamai Group Name"
  type        = string
}


# -------------------------------------------------
# Zone, SOA record and NS record
# -------------------------------------------------

variable "dns_zone" {
  description = "DNS Zone Name in Akamai EdgeDNS"
  type = object(
    {
      name = string
      comment = string
    }
  )
}

variable "ns_servers" {
  description = "Akamai Name Servers list"
  type        = list(string)
}

variable "soa_email" {
  description = "Properly formatted email for the SOA DNS record"
  type        = string
}


# -------------------------------------------------
# DNS Records
# -------------------------------------------------

variable "dns_zam" {
  description = "Akamai Zone Appex Mapping. Top Level Domain record (i.e. example.com). Target must be a valid edge hostname."
  type = object(
    {
      name = string
      target = string
    }
  )
}

variable "additional_records" {
  description = "List of objects for additional records to configure"
  type        = map(object({
          recordType = string
          ttl = number
          target = string
          name = string
    }))
}
