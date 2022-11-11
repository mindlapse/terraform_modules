output "read_arn" {
    value = aws_iam_policy.read.arn
}

output "save_arn" {
    value = aws_iam_policy.save.arn
}

output "delete_arn" {
    value = aws_iam_policy.delete.arn
}
