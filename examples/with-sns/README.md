# S3 Alarms with SNS Notifications Example

This example demonstrates how to use the S3 CloudWatch alarms module with SNS notifications for alerts.

## Prerequisites

- An AWS account with appropriate permissions
- An email address to receive notifications

## Setup

1. Copy `terraform.tfvars.example` to `terraform.tfvars`
2. Edit `terraform.tfvars` to specify your email address:
   ```
   alert_email = "your.email@example.com"
   ```

## Usage

```bash
terraform init
terraform apply
```

You will receive an email asking you to confirm the SNS subscription. You must confirm this subscription to receive alarm notifications.

## What this example does

- Creates an S3 bucket named "example-monitored-bucket-with-sns"
- Creates an SNS topic and subscribes your email to it
- Applies CloudWatch alarms for monitoring 4XX and 5XX errors with:
  - 4XX errors threshold: 3 (stricter than default)
  - 5XX errors threshold: 1
  - Evaluation period: 60 seconds (1 minute, stricter than default)
  - Full alarm and OK notifications via SNS

## Notes

- The SNS subscription requires confirmation via email
- This example uses custom thresholds and a shorter evaluation period for more sensitive monitoring
- To destroy the created resources, use `terraform destroy` 