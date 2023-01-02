module "sqs_lambda" {
    source = "../sqs_lambda"

    env = "dev"
    product = "foo"
    image_name = "img"
    function_name = "bar"
    lambda_policies = []
    fifo = false
}
