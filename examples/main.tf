// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

module "secret" {
  source = "../"

  for_each = var.secrets

  tenancy_ocid = var.tenancy_ocid
  compartment  = each.value["compartment"]
  name         = each.key
  description  = lookup(each.value, "description", null)
  content      = base64encode(file("${var.secret}"))
  vault        = each.value["vault"]
  defined_tags = lookup(each.value, "defined_tags", {})
}