provider "aws" {
    alias = "primary_region"
    region = var.primary_region
}

provider "aws" {
    alias = "backup_region"
    region = var.backup_region
}
