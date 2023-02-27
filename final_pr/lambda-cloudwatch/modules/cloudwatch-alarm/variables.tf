variable "alarm_name" {
  type        = string
  default     = "alarm"
  description = "Alarm name"
}

variable "comparison_operator" {
  type        = string
  default     = "GreaterThanThreshold"
  description = "comparison_operator"
}

variable "evaluation_periods" {

  default     = "1"
  description = "evaluation_periods"
}

variable "metric_name" {
  type        = string
  default     = "CPUUtilization"
  description = "metric_name"
}

variable "namespace" {
  type        = string
  default     = "AWS/EC2"
  description = "names"
}

variable "period" {
  type        = number
  default     = "60"
  description = "period"
}

variable "statistic" {
  type        = string
  default     = "Average"
  description = "statistic"
}

variable "threshold" {
  type        = number
  default     = "50"
  description = "threshold"
}

variable "datapoints_to_alarm" {
  type        = number
  default     = 1
  description = "datapoints_to_alarm"
}

variable "alarm_description" {
  type        = string
  default     = ""
  description = "alarm_description"
}

variable "actions_enabled" {
  type        = bool
  default     = "true"
  description = "actions_enabled"
}

variable "dimensions" {
  type        = map(string)
  default     = {}
  description = "dimensions"
}


variable "alarm_actions" {
  type        = list(string)
  default     = []
  description = ""
}


variable "ok_actions" {
  type        = list(any)
  default     = []
  description = ""
}
