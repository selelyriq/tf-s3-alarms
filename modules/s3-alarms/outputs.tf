output "s3_4xx_errors_alarm_id" {
  description = "The ID of the 4XX errors CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.s3_4xx_errors.id
}

output "s3_5xx_errors_alarm_id" {
  description = "The ID of the 5XX errors CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.s3_5xx_errors.id
}

output "s3_4xx_errors_alarm_arn" {
  description = "The ARN of the 4XX errors CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.s3_4xx_errors.arn
}

output "s3_5xx_errors_alarm_arn" {
  description = "The ARN of the 5XX errors CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.s3_5xx_errors.arn
} 