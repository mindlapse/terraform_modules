module "bucket_backup_region" {
    
    source = "./bucket"
    env = var.env
    product = var.product

    bucket_suffix = "backup"

    providers = {
        aws = aws.backup_region
    }
}
