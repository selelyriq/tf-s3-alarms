variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "project_name" {
  description = "Name of the project, used as prefix for resources"
  type        = string
  default     = "s3-monitoring"
}

variable "error_4xx_threshold" {
  description = "Threshold for 4XX errors alarm"
  type        = number
  default     = 5
}

variable "error_5xx_threshold" {
  description = "Threshold for 5XX errors alarm"
  type        = number
  default     = 1
}

variable "enable_notifications" {
  description = "Whether to enable SNS notifications for alarms"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
