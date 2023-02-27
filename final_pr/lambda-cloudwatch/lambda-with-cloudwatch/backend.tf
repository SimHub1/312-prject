terraform {
  backend "s3" {
    bucket         = "22c-ubuntu"
    key            = "cloudwatch-alarms/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-Lambda-cloudwatch-alarm"
  }
}


resource "aws_dynamodb_table" "terraform_lock" {
    name           = "terraform-Lambda-cloudwatch-alarm"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}