output "secret_arns" {
  description = "Map of secret ARNs"
  value       = { for k, v in aws_secretsmanager_secret.default : k => v.arn }
}

output "secret_names" {
  description = "Map of secret names"
  value       = { for k, v in aws_secretsmanager_secret.default : k => v.name }
}

output "secret_version_ids" {
  description = "Map of secret version IDs"
  value       = { for k, v in aws_secretsmanager_secret_version.default : k => v.version_id }
} 