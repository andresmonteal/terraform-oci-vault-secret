output "secret_id" {
  description = "secret id"
  value       = oci_vault_secret.main[0].id
}

output "public_ssh_key_id" {
  description = "secret id"
  value       = oci_vault_secret.main[1].id
}

output "secret_content" {
  description = "secret content"
  value       = oci_vault_secret.main[0].secret_content.content
}

output "public_ssh_key" {
  description = "secret content"
  value       = oci_vault_secret.main[1].secret_content.content
}