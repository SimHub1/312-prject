# What is AWS Lambda?

Lambda is a compute service that lets you run code without provisioning or managing servers. Lambda runs your code on a high-availability compute infrastructure and performs all of the administration of the compute resources, including server and operating system maintenance, capacity provisioning and automatic scaling, code monitoring and logging. 

# When should I use Lambda?
Lambda is an ideal compute service for many application scenarios, as long as you can run your application code using the Lambda [standard runtime environment](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html) and within the resources that Lambda provides.
When using Lambda, you are responsible only for your code. Lambda manages the compute fleet that offers a balance of memory, CPU, network, and other resources to run your code. Because Lambda manages these resources, you cannot log in to compute instances or customize the operating system on provided runtimes. Lambda performs operational and administrative activities on your behalf, including managing capacity, monitoring, and logging your Lambda functions.

[Lambda intergrates with other AWS services](https://docs.aws.amazon.com/lambda/latest/dg/lambda-services.html) to invoke functions based on events that you specify. For example:

Use [API Gateway](https://docs.aws.amazon.com/lambda/latest/dg/services-apigateway.html) to provide a secure and scalable gateway for web APIs that route HTTP requests to Lambda functions.

For services that generate a queue or data stream (such as [DynamoDB](https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html) and [Kinesis](https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html)), Lambda polls the queue or data stream from the service and invokes your function to process the received data.

Define [Amazon S3](https://docs.aws.amazon.com/lambda/latest/dg/with-s3.html) events that invoke a Lambda function to process Amazon S3 objects, for example, when an object is created or deleted.

Use a Lambda function to process [Amazon SQS](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html) messages or [Amazon Simple Notification Service (Amazon SNS)](https://docs.aws.amazon.com/lambda/latest/dg/with-sns.html) notifications.

Use [AWS Step Functions](https://docs.aws.amazon.com/lambda/latest/dg/lambda-stepfunctions.html) to connect Lambda functions together into serverless workflows called state machines.





# Usage 

### Lambda Function with SNS topic.
```hcl
module "notify_slack"{
    source      = "../modules/lambda"
    
    
    slack_webhook_url = "https://hooks.slack.com/services/TLEPEU71S/FHDFGHHFG/DEMO"
    slack_username    = "slack-user"
    slack_channel     = "slack-channel"

    lambda_policy_name = "lambda_policy"
    lambda_role_name   = "lambda_role"
    function_name = "lambda_function"
    sns_topic_name = "High_CPU_Utilization"

}
```




## Useful Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.additional_inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.additional_json](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.additional_jsons](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.async](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.dead_letter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tracing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.additional_inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.additional_json](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.additional_jsons](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.additional_many](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.additional_one](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.async](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.dead_letter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.tracing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_event_source_mapping.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function_event_invoke_config.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function_event_invoke_config) | resource |
| [aws_lambda_layer_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [aws_lambda_permission.current_version_triggers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.unqualified_alias_triggers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_provisioned_concurrency_config.current_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_provisioned_concurrency_config) | resource |
| [aws_s3_bucket_object.lambda_package](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [local_file.archive_plan](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.archive](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_arn.log_group_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |
| [aws_cloudwatch_log_group.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudwatch_log_group) | data source |
| [aws_iam_policy.tracing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.additional_inline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.async](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.dead_letter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [external_external.archive_prepare](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

##  Lambda module Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lack_webhook_url"></a> [slack_webhook_url](slack_webhook_url) | Slack webhook url| `string` | `""` | yes |
| <a name="input_slack_username"></a> [slack_username](slack_username) | slack username | `string` | `""` | yes |
| <a name="input_slack_channel"></a> [slack_channel](slack_channel) | slack channel | `string` | `""` | yes |
| <a name="input_lambda_policy_name"></a> [lambda_policy_name](lambda_policy_name) | lambda policy name | `string` | `"lambda_policy"` | no |
| <a name="input_lambda_role_name"></a> [lambda_role_name](lambda_role_name) | lambda role name | `string` | `"lambda_role"` | no |
| <a name="input_type"></a> [type](type) | Lambda function file type| `string` | `"zip"` | no |
| <a name="input_source_file"></a> [source_file](source_file) | Lambda function  source file | `string` | `notify_slack.py` | no |
| <a name="input_function_name"></a> [function_name](function_name) | Lambda function name | `string` | `lambda_function` | no |
| <a name="input_sns_topic_name"></a> [sns_topic_name](sns_topic_name) | Sns topic name | `string` | `""` | yes |
| <a name="input_endpoint_auto_confirms"></a> [endpoint_auto_confirms](endpoint_auto_confirms) | Auto confirming sns subscription | `bool` | `true` | no |

## Lambda module Outputs

| Name | Description |
|------|-------------|
| <a name="output_laws_sns_topic_arn"></a> [aws_sns_topic_arn](aws_sns_topic_arn) | The ARN of the SNS topic from which messages will be sent to Slack |
| <a name="output_aws_lambda_role_arn"></a> [aws_lambda_role_arn](aws_lambda_role_arn) | Gets the lambda role ARN |
| <a name="output_aws_lambda_function_arn"></a> [aws_lambda_function_arn](aws_lambda_function_arn) | Gets the lambda function ARN|
