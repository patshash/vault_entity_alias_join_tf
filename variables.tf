variable "vault_address" {
  description = "The URL of the Vault server (e.g. https://vault.example.com:8200)"
  type        = string
}

variable "vault_token" {
  description = "Vault authentication token"
  type        = string
  sensitive   = true
}

variable "vault_namespace" {
  description = "The Vault namespace to target (e.g. 'admin/my-namespace'). Leave empty for root namespace."
  type        = string
  default     = null
}

variable "entity_name" {
  description = "Name of the Vault identity entity. Set this as a workspace variable in TFC/TFE so Sentinel can validate against it."
  type        = string
}

variable "entity_id_fail" {
  description = "ID of the Vault identity entity to test Sentinel enforcement. Set this as a workspace variable in TFC/TFE."
  type        = string
}

variable "entity_policies" {
  description = "List of policies to assign to the entity"
  type        = list(string)
  default     = []
}

variable "entity_metadata" {
  description = "Metadata key/value pairs for the entity"
  type        = map(string)
  default     = {}
}

variable "auth_backend_path" {
  description = "Path of the auth backend whose accessor will be used for the alias (e.g. 'userpass', 'ldap')"
  type        = string
}

variable "alias_name" {
  description = "Name of the entity alias (typically the username in the auth backend)"
  type        = string
}
