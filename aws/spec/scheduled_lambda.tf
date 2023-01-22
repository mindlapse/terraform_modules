module "scheduled_lambda" {
  source              = "../scheduled_lambda"
  env                 = "prod"
  product             = "foo"
  image_name          = "img"
  image_version       = "latest"
  function_name       = "bar"
  lambda_policies     = []
  schedule_expression = "rate(1 day)"
}
