variable aws_access_key {
  type        = string
  default     = "us-east-1"
  description = "Access key for AWS"
}

variable aws_secret_key {
  type        = string
  default     = "us-east-1"
  description = "Secret Access key for AWS"
  sensitive = true
}