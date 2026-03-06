terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }
  }
}

provider "vault" {
  address   = var.vault_address
  token     = var.vault_token
  namespace = var.vault_namespace
}

# 1. Create the entity in Vault using the workspace variable
resource "vault_identity_entity" "example" {
  name     = var.entity_name
  policies = var.entity_policies
  metadata = var.entity_metadata
}

# 2. Look up the entity by name (uses the same workspace variable)
data "vault_identity_entity" "lookup" {
  entity_name = var.entity_name

  depends_on = [vault_identity_entity.example]
}

# 3. Look up the auth backend accessor (needed for the alias)
data "vault_auth_backend" "example" {
  path = var.auth_backend_path
}

# 4. Add an entity alias — Sentinel enforces that only the entity
#    matching var.entity_name (set as a workspace variable) is modified.
resource "vault_identity_entity_alias" "example" {
  name           = var.alias_name
  mount_accessor = data.vault_auth_backend.example.accessor
  canonical_id   = data.vault_identity_entity.lookup.entity_id
}
