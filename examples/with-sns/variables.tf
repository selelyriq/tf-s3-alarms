variable "alert_email" {
  description = "Email address to send S3 error alerts to"
  type        = string

  # This is a placeholder - must be specified in a terraform.tfvars file or via command line
  # Example: terraform apply -var="alert_email=your.email@example.com"
} 