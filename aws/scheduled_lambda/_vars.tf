variable "env" {
    type = string
    description = "[dev, prod]"
}

variable "product" {
    type = string
    description = "product codename, e.g. 'ta'"
}

variable "tags" {
    type = map(any)
    default = {}
    description = "Tags to apply"
}

variable "image_name" {
    type = string
    description = "The name of the ECR image"
}

variable "image_version" {
    type = string
    default = "latest"
    description = "Image version"
}

variable "function_name" {
    type = string
    description = "The name of the Lambda function (without the prefix)"
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

variable "fifo" {
    type = bool
    default = false
    description = "Enables FIFO on the SQS queue created"
}

variable "schedule_expression" {
    type = string
    default = ""
    description = "Either cron(...) or rate(...) syntax, or omit to disable"
}

variable "memory_size" {
    type = number
    default = 256
    description = "Amount of memory to give the Lambda"
}