variable "env" {
    type = string
    description = "example: prod"
}

variable "product" {
    type = string
    description = "example: foo"
}

variable "bucket_suffix" {
    type = string
    default = ""
    description = "An optional suffix.  Buckets are named <product>-<env>-tfstate-bucket-<bucket_suffix>"
}