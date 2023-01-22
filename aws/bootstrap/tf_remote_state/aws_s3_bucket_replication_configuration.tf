/*
Cross-region replication config
Replicates the terraform .tfstate in ca-central-1 (Montreal) to ap-southeast-2 (Sydney)
*/
resource "aws_s3_bucket_replication_configuration" "replication" {

  # Must have bucket versioning enabled first
  depends_on = [module.bucket_backup_region.versioning_id, module.bucket_primary_region.versioning_id]

  role   = aws_iam_role.replication.arn
  bucket = module.bucket_primary_region.id

  rule {
    id = "FirstRuleOfReplication"
    delete_marker_replication {
      status = "Disabled"
    }

    filter {}

    status = "Enabled"

    destination {
      bucket        = module.bucket_backup_region.arn
      storage_class = "STANDARD_IA"
    }
  }
}