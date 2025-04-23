provider "aws" {
  region = "us-east-1"
}

module "secrets" {
  source = "../"

  secrets = {
    "database" = {
      name        = "prod/database/credentials"
      description = "Database credentials for production environment"
      secret_string = jsonencode({
        username = "dbadmin"
        password = "supersecretpassword"
        host     = "prod-db.example.com"
        port     = 5432
      })
      tags = {
        Environment = "production"
        Service     = "database"
      }
    },
    "api" = {
      name        = "prod/api/keys"
      description = "API keys for production environment"
      secret_string = jsonencode({
        api_key    = "sk_live_123456789"
        api_secret = "sk_live_987654321"
      })
      tags = {
        Environment = "production"
        Service     = "api"
      }
    },
    "redis" = {
      name        = "prod/redis/credentials"
      description = "Redis credentials for production environment"
      secret_string = jsonencode({
        password = "redispassword123"
        host     = "redis.example.com"
        port     = 6379
      })
      tags = {
        Environment = "production"
        Service     = "redis"
      }
    }
  }

  tags = {
    Project     = "MyProject"
    ManagedBy   = "Terraform"
    Environment = "production"
  }
}

# Output the secret ARNs
output "database_secret_arn" {
  description = "The ARN of the database secret"
  value       = module.secrets.secret_arns["database"]
}

output "api_secret_arn" {
  description = "The ARN of the API secret"
  value       = module.secrets.secret_arns["api"]
}

output "redis_secret_arn" {
  description = "The ARN of the Redis secret"
  value       = module.secrets.secret_arns["redis"]
} 