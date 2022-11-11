
variable "env" {
    type = string
    description = "[dev, prod]"
}

variable "product" {
    type = string
    description = "product codename, e.g. 'ta'"
}

variable "tags" {
    type = object({
        product = string
        env = string
    })
    description = "Tags to apply"
}


variable "name" {
    type = string
    description = "A camelcase name (no spaces or underscores) to differentiate use"
}

variable "table_arn" {
    type = string
    description = "ARN of the dynamodb table"
}
