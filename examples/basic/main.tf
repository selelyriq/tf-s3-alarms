provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "example-monitored-bucket"

  tags = {
    Environment = "Dev"
    Terraform   = "true"
  }
}

module "s3_alarms" {
  source = "../../modules/s3-alarms"

  bucket_name = aws_s3_bucket.example.id

  # Using all default settings for alarms
} 