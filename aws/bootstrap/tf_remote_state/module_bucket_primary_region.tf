module "bucket_primary_region" {

  source  = "./bucket"
  env     = var.env
  product = var.product

  bucket_suffix = "primary"

  providers = {
    aws = aws.primary_region
  }
}
