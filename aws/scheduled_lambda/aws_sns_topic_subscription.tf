
resource "aws_sns_topic_subscription" "sub" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.q.arn
#   filter_policy = var.sns_filter_policy
}
