output "aws_sns_topic_arn" {
  value       = aws_sns_topic.topic.arn
  description = "The ARN of the SNS topic from which messages will be sent to Slack"
}

output "aws_lambda_role_arn" {
  value       = aws_iam_role.lambda.arn
  description = "Gets the lambda role ARN"
}

output "aws_lambda_function_arn" {
  value       = aws_lambda_function.lambda.arn
  description = "Gets the lambda function ARN"
}
