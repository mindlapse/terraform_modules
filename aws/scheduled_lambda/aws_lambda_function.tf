



resource "aws_lambda_function" "lambda" {

  function_name = local.name
  role          = aws_iam_role.execution_role.arn
  image_uri     = "${local.account_id}.dkr.ecr.${local.region}.amazonaws.com/${var.image_name}:${var.image_version}"

  package_type = "Image"
  publish      = true
  timeout      = var.function_timeout
  memory_size  = var.memory_size


  tracing_config {
    mode = "PassThrough"
  }
  environment {
    variables = merge(var.environment, {
      "ENV"     = var.env
      "PRODUCT" = var.product
      "REGION"  = local.region
      "PREFIX"  = local.prefix
      "COMMAND" = var.function_name
      "SQS_URL" = aws_sqs_queue.q.url
      "SNS_ARN" = aws_sns_topic.topic.arn
    })
  }
}
