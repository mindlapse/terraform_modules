resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.state.id
    versioning_configuration {
        status = "Enabled"
    }
}
