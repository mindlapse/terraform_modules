
resource "aws_lambda_function" "lambda" {
  
  function_name = "${var.function_name}"
  role = "${aws_iam_role.execution_role.arn}"
  image_uri = "${local.account_id}.dkr.ecr.${local.region}.amazonaws.com/${var.image_name}:${var.env}"
  
  package_type = "Image"
  publish = true
  timeout = var.function_timeout
  memory_size = 256
  
  tracing_config {
    mode = "PassThrough"
  }
  
  environment {
    variables = merge(var.environment, {
      "ENV" = var.env
      "REGION" = local.region
      "PRODUCT" = var.product
    })
  }
}


resource "aws_lambda_event_source_mapping" "example" {
  event_source_arn = var.sqs_arn
  function_name    = aws_lambda_function.lambda.arn
  batch_size = 1
}


resource "aws_lambda_function_event_invoke_config" "example" {
  function_name                = aws_lambda_function.lambda.arn
  maximum_retry_attempts       = 0
}