provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "example-monitored-bucket-with-sns"

  tags = {
    Environment = "Production"
    Terraform   = "true"
  }
}

# Create an SNS topic for the alerts
resource "aws_sns_topic" "s3_alerts" {
  name = "s3-error-alerts"

  tags = {
    Purpose = "S3 Monitoring"
  }
}

# Create an SNS topic subscription (email)
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.s3_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# Use the S3 alarms module with custom thresholds and SNS notifications
module "s3_alarms" {
  source = "../../modules/s3-alarms"

  bucket_name       = aws_s3_bucket.example.id
  alarm_name_prefix = "production"

  # Custom thresholds for stricter monitoring
  error_4xx_threshold = 3
  error_5xx_threshold = 1

  # Shorter evaluation period (1 minute)
  period = 60

  # Use SNS topic for notifications
  alarm_actions = [aws_sns_topic.s3_alerts.arn]
  ok_actions    = [aws_sns_topic.s3_alerts.arn]

  tags = {
    Environment = "Production"
    CostCenter  = "Operations"
  }
} 