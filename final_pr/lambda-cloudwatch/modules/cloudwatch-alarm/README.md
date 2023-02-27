# Cloudwatch Metric-Alarm

CloudWatch Alarms feature allows you to watch CloudWatch metrics and to receive notifications when the metrics fall outside of the levels (high or low thresholds) that you configure. You can attach multiple Alarms to each metric and each one can have multiple actions.
Here: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html


# Creating CloudWatch Alarms
You can create a CloudWatch alarm that watches a single CloudWatch metric. An alarm can be in one of three status: OK means the metric is within the defined threshold, ALARM means the metric is outside of the defined threshold, or INSUFFICIENT_DATA, which means enough information has yet to be gathered which can determine whether the metric is within or outside of the threshold range.


## Metric alarm states
A metric alarm has the following possible states:

<b>OK</b> – The metric or expression is within the defined threshold.

<b>ALARM</b> – The metric or expression is outside of the defined threshold.

<b>INSUFFICIENT_DATA</b> – The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.


### Evaluating an alarm
When you create an alarm, you specify three settings to enable CloudWatch to evaluate when to change the alarm state:

Period is the length of time to evaluate the metric or expression to create each individual data point for an alarm. It is expressed in seconds. If you choose one minute as the period, the alarm evaluates the metric once per minute.

Evaluation Periods is the number of the most recent periods, or data points, to evaluate when determining alarm state.

Datapoints to Alarm is the number of data points within the Evaluation Periods that must be breaching to cause the alarm to go to the ALARM state. The breaching data points don't have to be consecutive, but they must all be within the last number of data points equal to Evaluation Period.

In the following figure, the alarm threshold for a metric alarm is set to three units. Both Evaluation Period and Datapoints to Alarm are 3. That is, when all existing data points in the most recent three consecutive periods are above the threshold, the alarm goes to ALARM state. In the figure, this happens in the third through fifth time periods. At period six, the value dips below the threshold, so one of the periods being evaluated is not breaching, and the alarm state changes back to OK. During the ninth time period, the threshold is breached again, but for only one period. Consequently, the alarm state remains OK.


## Configuring how CloudWatch alarms treat missing data
For each alarm, you can specify CloudWatch to treat missing data points as any of the following:

<b>notBreaching</b> – Missing data points are treated as "good" and within the threshold,

<b>breaching</b> – Missing data points are treated as "bad" and breaching the threshold

<b>ignore</b> – The current alarm state is maintained

<b>missing</b> – If all data points in the alarm evaluation range are missing, the alarm transitions to INSUFFICIENT_DATA.

The best choice depends on the type of metric. For a metric that continually reports data, such as `CPUUtilization` of an instance, you might want to treat missing data points as breaching, because they might indicate that something is wrong. But for a metric that generates data points only when an error occurs, such as `ThrottledRequests in Amazon DynamoDB`, you would want to treat missing data as `notBreaching`. The default behavior is missing.

Choosing the best option for your alarm prevents unnecessary and misleading alarm condition changes, and also more accurately indicates the health of your system.


# Amazon Introduces Cloudwatch Cross Account Alarms to Consolidate Management
Amazon CloudWatch recently announced cross account alarms, a new feature that enables customers to set alerts and take actions based on changes to metrics across different AWS accounts.

Cross account alarms provide alerting based on metrics in different AWS accounts and can be used in combination with existing cross account dashboards to centralize operational visibility. Furthermore It is possible to combine metrics from different accounts using the metric math and organize cross account alarms into hierarchies using composite alarms in the monitoring account.
Enabling an AWS account to view cross-account CloudWatch data triggers the creation of a service-linked role AWSServiceRoleForCloudWatchCrossAccount that CloudWatch uses in the monitoring account to access data shared from the other accounts. AWS provides a page with information and examples on how to enable cross-account functionality in CloudWatch, how to integrate with AWS Organizations and how to troubleshoot the most common errors in a CloudWatch cross-account setup.

CloudWatch also allows cross-account and cross-region dashboards to allow centralized visibility of metrics, and logs across a group of related accounts without having to centralize data. With both cross account alarms and dashboards, there is no forwarding or duplication of data across accounts. Cross account alarms are available in all AWS regions and the `standard CloudWatch alarm pricing` applies.



# Usage

`Example cloudwatch-alarm module`
```hcl 

module "cloudwatch_alarm_EKS_Cluster" {
  source = "../modules/cloudwatch-alarm"

  alarm_name          = "EKS Cluster High CPU"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "80"
  datapoints_to_alarm = 1     # very IMPORTANT
  alarm_description   = "EKS Cluster high CPU 80%"
  actions_enabled     = "true"
  alarm_actions       = [module.notify_slack.aws_sns_topic_arn]
  ok_actions          = []
  dimensions = {
    AutoScalingGroupName = "eks-OnDemand-21b-project-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

  }

}
```
## IMPORTANT NOTE: Make sure to use ALL THE TIME `datapoints_to_alarm` argument, otherwise you will not be able to get the datapoints for your resource and your alarm setting will not work properly.



##  How to choose the correct CLOUDWATCH ARGUMENTS when creating alarms.
| Cloudwatch  METRIC ARGUMENTS |  Types to be used |
|------------------------------|-------------------|
| <a name="input_comparison_operator"></a> [comparison_operator](comparison_operator)|`GreaterThanOrEqualToThreshold`, `GreaterThanThreshold`,`LessThanThreshold`,`LessThanOrEqualToThreshold`,`LessThanLowerOrGreaterThanUpperThreshold`,`LessThanLowerThreshold`,`GreaterThanUpperThreshold`|
| <a name="input_metric_name"></a> [comparison_metric_name](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)| `CPUUtilization` and [MORE](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)|
| <a name="input_namespace"></a> [namespace](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)| `AWS/EC2`,`AWS/RDS` and [MORE](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)|
| <a name="input_evaluation_periods"></a> [evaluation_periods](evaluation_periods)| `"1"`,`"3"`,-- is the number of the most recent periods, or data points, to evaluate when determining alarm state. |
| <a name="input_period"></a> [period](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)| `"60"` (in seconds )|
| <a name="input_statistic"></a> [statistic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference)|`SampleCount`,`Average`,`Sum`,`Minimum`,`Maximum`|
| <a name="input_threshold"></a> [threshold](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference)|`"80"` (in percents %) |
| <a name="input_datapoints_to_alarm"></a> [datapoints_to_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference)| `1` - The number of datapoints that must be breaching to trigger the alarm.|
| <a name="input_dimensions"></a> [dimensions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)| `DBInstanceIndentifier`(for RDS ) and [MORE](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)   |
| <a name="input_actions_enabled"></a> [actions_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference)| `true`,`false`|
| <a name="input_alarm_actions"></a> [alarm_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference)|`require SNS topic ARN` - The list of actions to execute when this alarm transitions into an ALARM state from any other state.|
| <a name="input_ok_actions"></a> [ok_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm#argument-reference)|`require SNS topic ARN` - The list of actions to execute when this alarm transitions into an OK state from any other state.|


## Cloudwatch alarm module Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true. | `bool` | `true` | no |
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `null` | no |
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | The description for the alarm. | `string` | `null` | no |
| <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name) | The descriptive name for the alarm. This name must be unique within the user's AWS account. | `string` | n/a | yes |
| <a name="input_comparison_operator"></a> [comparison\_operator](#input\_comparison\_operator) | The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. | `string` | n/a | yes |
| <a name="input_create_metric_alarm"></a> [create\_metric\_alarm](#input\_create\_metric\_alarm) | Whether to create the Cloudwatch metric alarm | `bool` | `true` | no |
| <a name="input_datapoints_to_alarm"></a> [datapoints\_to\_alarm](#input\_datapoints\_to\_alarm) | The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | The dimensions for the alarm's associated metric. | `any` | `null` | no |
| <a name="input_evaluate_low_sample_count_percentiles"></a> [evaluate\_low\_sample\_count\_percentiles](#input\_evaluate\_low\_sample\_count\_percentiles) | Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate. | `string` | `null` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold. | `number` | n/a | yes |
| <a name="input_statistic"></a> [statistic](statistic) | The percentile statistic for the metric associated with the alarm.  | `string` | `Average` | no |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | The name for the alarm's associated metric. See docs for supported metrics. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics. | `string` | `null` | no |
| <a name="input_ok_actions"></a> [ok\_actions](#input\_ok\_actions) | The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `null` | no |
| <a name="input_period"></a> [period](#input\_period) | The period in seconds over which the specified statistic is applied. | `string` | `null` | no |
| <a name="input_statistic"></a> [statistic](#input\_statistic) | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The value against which the specified statistic is compared. | `number` | n/a | yes |



## Cloudwatch alarm module Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_metric_alarm_arn"></a> [cloudwatch_metric_alarm_arn](cloudwatch_metric_alarm_arn) | Gets the cloudwatch metric alarm ARN |
| <a name="output_cloudwatch_metric_alarm_id"></a> [cloudwatch_metric_alarm_id](cloudwatch_metric_alarm_id) | Gets the ID of the cloudwatch metric alarm  |
