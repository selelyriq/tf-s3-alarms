# Basic S3 Alarms Example

This example demonstrates the most basic usage of the S3 CloudWatch alarms module.

## Usage

```bash
terraform init
terraform apply
```

## What this example does

- Creates an S3 bucket named "example-monitored-bucket"
- Applies default CloudWatch alarms for monitoring 4XX and 5XX errors
  - 4XX errors threshold: 5 (default)
  - 5XX errors threshold: 1 (default)
  - Evaluation period: 300 seconds (5 minutes, default)

## Notes

- This example uses the default values for all alarm configurations
- No notifications are set up (SNS is not used)
- To destroy the created resources, use `terraform destroy` 