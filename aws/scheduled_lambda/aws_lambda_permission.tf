resource "aws_lambda_permission" "logging" {
  count         = var.schedule_expression != "" ? 1 : 0
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.timing[0].arn
}
