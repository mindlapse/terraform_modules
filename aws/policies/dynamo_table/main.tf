

resource "aws_iam_policy" "save" {
    name = "${local.prefix}_save_${lower(var.name)}"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "Save${var.name}"
                Action = [
                    "dynamodb:PutItem",
                    "dynamodb:UpdateItem",
                ]
                Effect = "Allow"
                Resource = var.table_arn
            }
        ]
    })
}

resource "aws_iam_policy" "read" {
    name = "${local.prefix}_read_${lower(var.name)}"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "Read${var.name}"
                Action = [
                    "dynamodb:Scan",
                    "dynamodb:Query",
                    "dynamodb:GetItem",
                ]
                Effect = "Allow"
                Resource = var.table_arn
            }
        ]
    })
}


resource "aws_iam_policy" "delete" {
    name = "${local.prefix}_delete_${lower(var.name)}"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "Delete${var.name}"
                Action = [
                    "dynamodb:DeleteItem",
                ]
                Effect = "Allow"
                Resource = var.table_arn
            }
        ]
    })
}
