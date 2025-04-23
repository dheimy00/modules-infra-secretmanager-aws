# AWS Secrets Manager Terraform Module

This Terraform module creates and manages AWS Secrets Manager secrets with support for multiple secrets and various configuration options.

## Features

- Create multiple secrets in a single module
- Support for KMS encryption
- Configurable recovery window
- Version staging support
- Tag management
- Flexible secret configuration

## Usage

```hcl
module "secrets" {
  source = "path/to/module"

  secrets = {
    "app-secret" = {
      name        = "my-app-secret"
      description = "Secret for my application"
      secret_string = "my-secret-value"
      tags = {
        Environment = "production"
      }
    },
    "db-secret" = {
      name        = "my-db-secret"
      description = "Database credentials"
      secret_string = "db-connection-string"
      kms_key_id = "arn:aws:kms:region:account:key/key-id"
    }
  }

  tags = {
    Project     = "MyProject"
    ManagedBy   = "Terraform"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| secrets | Map of secrets to create | map(object) | n/a | yes |
| tags | A map of tags to add to all secrets | map(string) | {} | no |
| aws_region | The AWS region to deploy resources | string | "us-east-1" | no |

### Secret Object Structure

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the secret | string | n/a | yes |
| description | The description of the secret | string | n/a | yes |
| secret_string | The secret string to store | string | n/a | yes |
| kms_key_id | The KMS key ID to use for encryption | string | null | no |
| recovery_window_in_days | The number of days to wait before deleting the secret | number | 30 | no |
| force_overwrite_replica_secret | Whether to force overwrite of replica secret | bool | false | no |
| version_stages | The list of version stages to attach to the secret | list(string) | ["AWSCURRENT"] | no |
| tags | A map of tags to add to the secret | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| secret_arns | Map of secret ARNs |
| secret_names | Map of secret names |
| secret_version_ids | Map of secret version IDs |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| aws | ~> 4.0 |

## License

MIT 