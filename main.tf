

# OCI Transit Module
module "oci_transit_1" {
  source      = "terraform-aviatrix-modules/oci-transit/aviatrix"
  version     = "4.0.3"

  cidr        = "10.77.0.0/20"
  region      = "eu-frankfurt-1"
  account     = "EskimooOCI"

  name = "avffhub"
  ha_gw = "false"
  
}

# OCI Spoke Module
module "oci_spoke_1" {
  source         = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version        = "4.0.6"

  count = 2

  name            = "avffsp${count.index}"
  cidr            = var.spoke_cidrs[count.index]
  region          = "eu-frankfurt-1"
  account         = "EskimooOCI"
  transit_gw      = "avx-avffhub-transit"
  
  ha_gw = "false"
  
  
}