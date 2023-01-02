
resource "aws_sqs_queue" "q" {
  name                        = "${var.function_name}${var.fifo ? ".fifo" : ""}"
  fifo_queue                  = var.fifo
  content_based_deduplication = var.fifo
  tags = var.tags
  visibility_timeout_seconds = var.function_timeout * 5
  
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = var.max_receive_count
  })
}

resource "aws_sqs_queue" "dlq" {
  name = "${var.function_name}_dlq${var.fifo ? ".fifo" : ""}"
  tags = var.tags
  fifo_queue = var.fifo
}

resource "aws_sns_topic_subscription" "sub" {
  count = var.sns_topic_arn != null ? 1 : 0
  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.q.arn
  filter_policy = var.sns_filter_policy
}