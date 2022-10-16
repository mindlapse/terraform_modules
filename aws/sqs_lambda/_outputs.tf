output "sqs_arn" {
    value = aws_sqs_queue.q.arn
}

output "lambda_arn" {
    value = aws_lambda_function.lambda.arn
}

output "lambda_function_name" {
    value = aws_lambda_function.lambda.function_name
}
