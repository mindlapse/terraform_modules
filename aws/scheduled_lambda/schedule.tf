resource "aws_cloudwatch_event_rule" "timing" {
  count = var.schedule_expression != "" ? 1 : 0
  name  = "${local.name}_schedule"

  schedule_expression = var.schedule_expression
  event_bus_name      = "default"
  tags                = var.tags
}


resource "aws_cloudwatch_event_target" "timing" {
  count     = var.schedule_expression != "" ? 1 : 0
  rule      = aws_cloudwatch_event_rule.timing[0].name
  target_id = "InvokeLambda"
  arn       = aws_lambda_function.lambda.arn
}

resource "aws_lambda_permission" "logging" {
  count         = var.schedule_expression != "" ? 1 : 0
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.timing[0].arn
}

