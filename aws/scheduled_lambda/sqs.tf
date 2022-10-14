

resource "aws_sqs_queue" "q" {
  name                        = "${local.name}${var.fifo ? ".fifo" : ""}"
  fifo_queue                  = var.fifo
  content_based_deduplication = var.fifo
  visibility_timeout_seconds = 120
  message_retention_seconds  = 1209600    // 14 days
  
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 1
  })
  tags = var.tags
}

resource "aws_sqs_queue" "dlq" {
  name = "${local.name}_dlq${var.fifo ? ".fifo" : ""}"
  fifo_queue = var.fifo
  tags = var.tags
}
