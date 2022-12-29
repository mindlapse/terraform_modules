/*
 * 
 * Common
 *
 */

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


/*
 * 
 * Lambda vars
 *
 */


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
    description = "A set of environment variables provided to the lambda"
}

variable "memory_size" {
    type = number
    default = 256
    description = "The amount of memory to allocate for the function"
}


/*
 * 
 * SNS vars
 *
 */


variable "sns_topic_arn" {
    type = string
    default = null
    description = "ARN of the SNS topic that can SendMessage to this queue"
}

variable "sns_filter_policy" {
    type = string
    default = null
    description = "An SNS filter policy, useful for routing"
}


/*
 * 
 * SQS vars
 *
 */

variable "fifo" {
    type = bool
    description = "Enable to use a FIFO queue."
}

variable "max_receive_count" {
    type = number
    default = 5
    description = "The number of retries before sending to the DLQ"
}