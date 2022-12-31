output "id" {
    description = "The bucket id"
    value = aws_s3_bucket.state.id
}

output "arn" {
    description = "The bucket ARN"
    value = aws_s3_bucket.state.arn
}

output "versioning_id" {
    description = "Use as a prerequisite dependency to enabling bucket replication"
    value = aws_s3_bucket_versioning.versioning.id
}