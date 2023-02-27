output "cloudwatch_metric_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.alarm.arn
  description = "Gets the cloudwatch metric alarm ARN"
}

output "cloudwatch_metric_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.alarm.id
  description = "Gets the ID of the cloudwatch metric alarm "
}
