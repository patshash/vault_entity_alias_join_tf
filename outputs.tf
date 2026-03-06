output "entity_id" {
  description = "ID of the created entity"
  value       = vault_identity_entity.example.id
}

output "looked_up_entity_id" {
  description = "Entity ID returned by the data source lookup"
  value       = data.vault_identity_entity.lookup.entity_id
}

output "entity_alias_id" {
  description = "ID of the created entity alias"
  value       = vault_identity_entity_alias.example.id
}
