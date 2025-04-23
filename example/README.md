# AWS Secrets Manager Module Example

This example demonstrates how to use the AWS Secrets Manager Terraform module to create and manage multiple secrets.

## Overview

The example creates three secrets:
1. Database credentials
2. API keys
3. Redis credentials

Each secret is properly tagged and structured using JSON format for better organization.

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

## Secret Structure

### Database Secret
```json
{
  "username": "dbadmin",
  "password": "supersecretpassword",
  "host": "prod-db.example.com",
  "port": 5432
}
```

### API Secret
```json
{
  "api_key": "sk_live_123456789",
  "api_secret": "sk_live_987654321"
}
```

### Redis Secret
```json
{
  "password": "redispassword123",
  "host": "redis.example.com",
  "port": 6379
}
```

## Outputs

The example outputs the ARNs of all created secrets, which can be used to reference the secrets in other Terraform configurations or applications.

## Security Note

This is an example configuration. In a real environment:
1. Never commit actual secrets to version control
2. Use a secure method to manage secret values
3. Consider using AWS KMS for additional encryption
4. Implement proper access controls and IAM policies 