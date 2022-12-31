resource "aws_s3_bucket_server_side_encryption_configuration" "sse_config" {
    bucket = aws_s3_bucket.state.bucket

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
        }
    }
}