resource "aws_s3_bucket" "state" {
    bucket = "${local.prefix}-tfstate-bucket-${var.bucket_suffix}"
    force_destroy = true
}