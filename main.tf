terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

# Example S3 bucket resource
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = var.tags
}

# Using the S3 CloudWatch Alarms module
module "s3_alarms" {
  source = "./modules/s3-alarms"

  bucket_name       = aws_s3_bucket.example.id
  alarm_name_prefix = var.project_name

  # Optional: Override default thresholds
  error_4xx_threshold = var.error_4xx_threshold
  error_5xx_threshold = var.error_5xx_threshold

  # Optional: Configure notifications
  alarm_actions = var.enable_notifications ? [aws_sns_topic.alerts[0].arn] : []
  ok_actions    = var.enable_notifications ? [aws_sns_topic.alerts[0].arn] : []

  tags = var.tags
}

# SNS Topic for alerts (conditional creation)
resource "aws_sns_topic" "alerts" {
  count = var.enable_notifications ? 1 : 0

  name = "${var.project_name}-s3-alerts"
  tags = var.tags
}
