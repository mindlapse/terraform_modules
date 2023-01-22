resource "aws_cloudwatch_event_target" "timing" {
  count     = var.schedule_expression != "" ? 1 : 0
  rule      = aws_cloudwatch_event_rule.timing[0].name
  target_id = "InvokeLambda"
  arn       = aws_lambda_function.lambda.arn
}