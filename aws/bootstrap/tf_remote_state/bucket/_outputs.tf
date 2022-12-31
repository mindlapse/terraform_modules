output "id" {
    description = "The bucket id"
    value = aws_s3_bucket.state.id
}

output "arn" {
    description = "The bucket ARN"
    value = aws_s3_bucket.state.arn
}