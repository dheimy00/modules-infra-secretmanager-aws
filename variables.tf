variable "secrets" {
  description = "Map of secrets to create"
  type = map(object({
    name                           = string
    description                    = string
    secret_string                  = string
    kms_key_id                     = optional(string)
    recovery_window_in_days        = optional(number, 30)
    force_overwrite_replica_secret = optional(bool, false)
    version_stages                 = optional(list(string), ["AWSCURRENT"])
    tags                           = optional(map(string), {})
  }))
}

variable "tags" {
  description = "A map of tags to add to all secrets"
  type        = map(string)
  default     = {}
}

variable "secret_description" {
  description = "The description of the secret"
  type        = string
  default     = "Default secret created by Terraform"
}

variable "secret_string" {
  description = "The secret string to store"
  type        = string
  sensitive   = true
  default     = null
}

variable "kms_key_id" {
  description = "The KMS key ID to use for encryption"
  type        = string
  default     = null
} 