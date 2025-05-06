output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "s3_4xx_errors_alarm_id" {
  description = "ID of the 4XX errors alarm"
  value       = module.s3_alarms.s3_4xx_errors_alarm_id
}

output "s3_5xx_errors_alarm_id" {
  description = "ID of the 5XX errors alarm"
  value       = module.s3_alarms.s3_5xx_errors_alarm_id
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic for alerts"
  value       = aws_sns_topic.s3_alerts.arn
}

output "sns_subscription_id" {
  description = "ID of the email subscription"
  value       = aws_sns_topic_subscription.email_subscription.id
} 