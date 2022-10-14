resource "aws_sns_topic" "topic" {
    name = "${local.name}"
    fifo_topic = false
    content_based_deduplication = false
    tags = var.tags
}

resource "aws_sns_topic_subscription" "sub" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.q.arn
#   filter_policy = var.sns_filter_policy
}
