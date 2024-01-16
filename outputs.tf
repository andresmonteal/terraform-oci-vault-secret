output "secret_id" {
  description = "secret id"
  value       = oci_vault_secret.main[0].id
}

output "public_ssh_key" {
  description = "secret id"
  value       = oci_vault_secret.main[1].id
}