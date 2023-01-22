module "bootstrap" {
  source  = "../../../bootstrap/tf_remote_state"
  product = "foo"
  env     = "dev"

  primary_region = "ca-central-1"
  backup_region  = "ap-southeast-2"
}