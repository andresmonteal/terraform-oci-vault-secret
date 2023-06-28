// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

########################
# Vault Secret
########################

locals {
  default_freeform_tags = {
    terraformed = "Please do not edit manually"
    module      = "oracle-terraform-oci-vault"
  }
  merged_freeform_tags = merge(var.freeform_tags, local.default_freeform_tags)
  compartment_id       = try(data.oci_identity_compartments.compartment[0].compartments[0].id, var.compartment_id)
  vault_id             = try(data.oci_kms_vaults.vault[0].vaults[0].id, var.vault_id)
  key_id               = try(data.oci_kms_keys.key.keys[0].id, var.key_id)
}

resource "oci_vault_secret" "main" {
  #Required
  compartment_id = local.compartment_id
  secret_content {
    #Required
    content_type = var.content_type

    #Optional
    content = var.content
  }
  secret_name = var.name
  vault_id    = local.vault_id

  #Optional
  defined_tags  = var.defined_tags
  description   = var.description
  freeform_tags = local.merged_freeform_tags
  key_id        = local.key_id

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}