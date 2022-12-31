variable "env" {
    type = string
    description = "[dev, prod]"
}

variable "product" {
    type = string
    description = "example: foo"
}

variable "primary_region" {
    type = string
    default = "ca-central-1"
    description = "The primary location for the versioned remote terraform state (e.g. ca-central-1) "
}

variable "backup_region" {
    type = string
    default = "ap-southeast-2"
    description = "The backup location storing a versioned remote terraform state (e.g. ap-southeast-2)"
}