resource "aws_secretsmanager_secret" "default" {
  for_each = var.secrets

  name                           = each.value.name
  description                    = each.value.description
  kms_key_id                     = each.value.kms_key_id
  recovery_window_in_days        = each.value.recovery_window_in_days
  force_overwrite_replica_secret = each.value.force_overwrite_replica_secret

  tags = merge(var.tags, each.value.tags)
}

resource "aws_secretsmanager_secret_version" "default" {
  for_each = var.secrets

  secret_id      = aws_secretsmanager_secret.default[each.key].id
  secret_string  = each.value.secret_string
  version_stages = each.value.version_stages
} 