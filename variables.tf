variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
}

variable "public_key" {
  description = "Public key string for EC2 key pair"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "RDS username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS admin password"
  type        = string
  sensitive   = true
}

variable "duckdns_token" {
  description = "DuckDNS authentication token"
  type        = string
  sensitive   = true
}
