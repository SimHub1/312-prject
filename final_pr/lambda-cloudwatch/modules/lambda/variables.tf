variable "slack_webhook_url" {
  type    = string
  default = ""
}

variable "slack_username" {
  type    = string
  default = ""
}

variable "slack_channel" {
  type    = string
  default = ""
}

variable "lambda_policy_name" {
  type        = string
  default     = "lambda_policy"
  description = "lambda policy name"
}

variable "lambda_role_name" {
  type        = string
  default     = "lambda_role"
  description = "lambda_role_name"
}

variable "type" {
  type        = string
  default     = "zip"
  description = "type"
}

variable "source_file" {
  type        = string
  default     = "notify_slack.py"
  description = "source_file"
}

variable "function_name" {
  type        = string
  default     = "lambda_function"
  description = "lambda_function_name"
}

variable "sns_topic_name" {
  type        = string
  default     = ""
  description = "sns_topic_name"
}

variable "principal" {
  type        = string
  default     = ""
  description = "principal"
}

variable "endpoint_auto_confirms" {
  type        = bool
  default     = "true"
  description = "auto confirming subscription "
}
