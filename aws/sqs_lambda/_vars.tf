
variable "env" {
    type = string
    description = "[dev, prod]"
}

variable "product" {
    type = string
    description = "product codename, e.g. 'ta'"
}

variable "tags" {
    type = object({
        product = string
        env = string
    })
    description = "Tags to apply"
}

variable "sqs_arn" {
    type = string
    description = "The ARN of the SQS topic that creates events for the lambda"
}

variable "image_name" {
    type = string
    description = "The name of the ECR image"
}

variable "function_name" {
    type = string
    description = "The name of the Lambda function"
}

variable "function_timeout" {
    type = number
    description = "Function timeout in seconds"
    default = 120
}

variable "lambda_policies" {
    type = list(string)
    description = "A list of aws_iam_policy resource ARNs to grant to the lambda function"
}

variable "environment" {
    type = map
    default = {}
    description = "A set of environment variables"
}
