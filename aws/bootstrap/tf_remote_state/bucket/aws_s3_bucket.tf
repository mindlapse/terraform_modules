resource "aws_s3_bucket" "state" {
  bucket        = "${local.prefix}-terraform-remote-state-${var.bucket_suffix}"
  force_destroy = true
}