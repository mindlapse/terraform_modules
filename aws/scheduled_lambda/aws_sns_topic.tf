resource "aws_sns_topic" "topic" {
    name = "${local.name}"
    fifo_topic = false
    content_based_deduplication = false
    tags = var.tags
}
