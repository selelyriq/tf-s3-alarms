output "bucket_id" {
  description = "The ID of the created S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "s3_4xx_errors_alarm_id" {
  description = "The ID of the 4XX errors CloudWatch alarm"
  value       = module.s3_alarms.s3_4xx_errors_alarm_id
}

output "s3_5xx_errors_alarm_id" {
  description = "The ID of the 5XX errors CloudWatch alarm"
  value       = module.s3_alarms.s3_5xx_errors_alarm_id
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic for alarms (if enabled)"
  value       = var.enable_notifications ? aws_sns_topic.alerts[0].arn : null
}
