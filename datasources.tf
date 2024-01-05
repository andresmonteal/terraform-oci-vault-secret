data "oci_identity_compartments" "compartment" {
  count = var.compartment == null ? 0 : 1
  #Required
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.compartment]
  }
}

data "oci_kms_vaults" "vault" {
  count = var.vault == null ? 0 : 1
  #Required
  compartment_id = local.compartment_id

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "display_name"
    values = [var.vault]
  }
}

data "oci_kms_keys" "key" {
  #Required
  compartment_id      = local.compartment_id
  management_endpoint = local.management_endpoint

  #Optional
  filter {
    name   = "state"
    values = ["ENABLED"]
  }

  depends_on = [data.oci_kms_vaults.vault]
}