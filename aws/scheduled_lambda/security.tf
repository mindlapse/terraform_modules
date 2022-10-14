
data "aws_iam_policy_document" "AWSLambdaTrustPolicy" {
  statement {
    actions    = ["sts:AssumeRole"]
    effect     = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}



resource "aws_iam_role" "execution_role" {
  name               = "${local.name}_execution_role"
  assume_role_policy = "${data.aws_iam_policy_document.AWSLambdaTrustPolicy.json}"
  managed_policy_arns = concat(var.lambda_policies, ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
  tags = var.tags
}


resource "aws_iam_role_policy" "sqs_policy" {

  role = aws_iam_role.execution_role.id

  name = "${local.prefix}_sqs_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes",
        ]
        Effect   = "Allow"
        Resource = "${aws_sqs_queue.q.arn}"
      },
    ]
  })
}


resource "aws_iam_role_policy" "sns_loopback" {
  role = aws_iam_role.execution_role.id

    name = "${local.prefix}_sns_loopback"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Sid = "AllowLoopbackSNSPublish"

            Action = ["sns:Publish"]
            Effect = "Allow"
            Resource = "${aws_sns_topic.topic.arn}"
        }]
    })
}

resource "aws_sqs_queue_policy" "sns_allow" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sns_policy",
  "Statement": [
    {
      "Sid": "AllowSNS",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.q.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.topic.arn}"
        }
      }
    }
  ]
}
POLICY
}
