
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
  name               = "${var.function_name}_execution_role"
  assume_role_policy = "${data.aws_iam_policy_document.AWSLambdaTrustPolicy.json}"
  managed_policy_arns = concat(var.lambda_policies, ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"])
}


resource "aws_iam_role_policy" "sqs_policy" {
  role = aws_iam_role.execution_role.id
  name = "sqs_policy"
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
        Resource = "${var.sqs_arn}"
      },
    ]
  })
}



