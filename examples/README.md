# S3 CloudWatch Alarms Module Examples

This directory contains examples demonstrating different ways to use the S3 CloudWatch alarms module.

## Available Examples

### [Basic Example](./basic)

A minimal example showing how to use the module with default settings.

Features:
- Creates an S3 bucket
- Sets up basic monitoring with default thresholds
- No notification integration

### [With SNS Notifications](./with-sns)

A more advanced example showing how to integrate with SNS for notifications.

Features:
- Creates an S3 bucket
- Sets up monitoring with custom thresholds
- Integrates with SNS for email notifications
- Uses custom evaluation periods

## Usage

Each example can be deployed independently. Navigate to the example directory and run:

```bash
terraform init
terraform apply
```

## Module Documentation

For detailed documentation about the module's inputs, outputs, and features, see the [module README](../modules/s3-alarms/README.md). 