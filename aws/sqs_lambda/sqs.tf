
resource "aws_sqs_queue" "q" {
  name                        = "${var.function_name}${var.fifo ? ".fifo" : ""}"
  fifo_queue                  = var.fifo
  content_based_deduplication = var.fifo
  tags = var.tags
  visibility_timeout_seconds = 120
  
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 1
  })
}

resource "aws_sqs_queue" "dlq" {
  name = "${var.function_name}_dlq${var.fifo ? ".fifo" : ""}"
  fifo_queue = var.fifo
}

resource "aws_sns_topic_subscription" "sub" {
  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.q.arn
  filter_policy = var.sns_filter_policy
}