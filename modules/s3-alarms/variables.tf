variable "bucket_name" {
  description = "Name of the S3 bucket to monitor"
  type        = string
}

variable "alarm_name_prefix" {
  description = "Prefix for the alarm names"
  type        = string
  default     = "s3-monitoring"
}

variable "evaluation_periods" {
  description = "Number of periods to evaluate for the alarm"
  type        = number
  default     = 1
}

variable "period" {
  description = "Period in seconds over which the specified statistic is applied"
  type        = number
  default     = 300 # 5 minutes
}

variable "error_4xx_threshold" {
  description = "Threshold for 4XX errors alarm"
  type        = number
  default     = 5
}

variable "error_5xx_threshold" {
  description = "Threshold for 5XX errors alarm"
  type        = number
  default     = 1
}

variable "alarm_actions" {
  description = "List of ARNs to notify when the alarm transitions to ALARM state"
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  description = "List of ARNs to notify when the alarm transitions to OK state"
  type        = list(string)
  default     = []
}

variable "treat_missing_data" {
  description = "How to treat missing data, can be 'missing', 'ignore', 'breaching', or 'notBreaching'"
  type        = string
  default     = "missing"
}

variable "tags" {
  description = "A map of tags to assign to the alarm resources"
  type        = map(string)
  default     = {}
} 