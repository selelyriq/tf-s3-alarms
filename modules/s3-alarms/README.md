# S3 CloudWatch Alarms Module

This Terraform module creates CloudWatch alarms for monitoring S3 bucket metrics, specifically focusing on 4XX and 5XX errors.

## Features

- Creates CloudWatch alarms for monitoring 4XX errors (client errors)
- Creates CloudWatch alarms for monitoring 5XX errors (server errors)
- Configurable thresholds, periods, and evaluation methods
- Supports SNS notification via alarm and OK actions

## Usage

```hcl
module "s3_alarms" {
  source = "./modules/s3-alarms"

  bucket_name        = "my-s3-bucket"
  alarm_name_prefix  = "my-project"
  
  # Optional: Override default thresholds
  error_4xx_threshold = 10
  error_5xx_threshold = 2
  
  # Optional: Configure notifications
  alarm_actions      = [aws_sns_topic.alerts.arn]
  ok_actions         = [aws_sns_topic.alerts.arn]
  
  # Optional: Add tags
  tags = {
    Environment = "Production"
    Project     = "MyProject"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| bucket_name | Name of the S3 bucket to monitor | string | n/a | yes |
| alarm_name_prefix | Prefix for the alarm names | string | "s3-monitoring" | no |
| evaluation_periods | Number of periods to evaluate for the alarm | number | 1 | no |
| period | Period in seconds over which the statistic is applied | number | 300 | no |
| error_4xx_threshold | Threshold for 4XX errors alarm | number | 5 | no |
| error_5xx_threshold | Threshold for 5XX errors alarm | number | 1 | no |
| alarm_actions | List of ARNs to notify when alarm state is ALARM | list(string) | [] | no |
| ok_actions | List of ARNs to notify when alarm state is OK | list(string) | [] | no |
| treat_missing_data | How to treat missing data | string | "missing" | no |
| tags | A map of tags to assign to the resources | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| s3_4xx_errors_alarm_id | The ID of the 4XX errors CloudWatch alarm |
| s3_5xx_errors_alarm_id | The ID of the 5XX errors CloudWatch alarm |
| s3_4xx_errors_alarm_arn | The ARN of the 4XX errors CloudWatch alarm |
| s3_5xx_errors_alarm_arn | The ARN of the 5XX errors CloudWatch alarm |

## Future Enhancements

This module is designed to be extended with additional alarms in the future, such as:
- Bucket size monitoring
- Request latency monitoring
- Storage usage metrics
- Access denied errors 