resource "aws_cloudwatch_event_rule" "timing" {
  count = var.schedule_expression != "" ? 1 : 0
  name  = "${local.name}_schedule"

  schedule_expression = var.schedule_expression
  event_bus_name      = "default"
  tags                = var.tags
}
