output "sns_arn" {
  value = aws_sns_topic.this.arn
}

output "sqs_arn" {
  value = aws_sqs_queue.this.arn
}

output "layers" {
  value = [{
    got = {
      arn          = aws_lambda_layer_version.got.arn
      layer_name   = aws_lambda_layer_version.got.layer_name
      version      = aws_lambda_layer_version.got.version
      description  = aws_lambda_layer_version.got.description
      created_date = aws_lambda_layer_version.got.created_date
    }
  }]
}

output "lambdas" {
  value = [{
    arn           = aws_lambda_function.create_category.arn
    function_name = aws_lambda_function.create_category.function_name
    description   = aws_lambda_function.create_category.description
    version       = aws_lambda_function.create_category.version
    last_modified = aws_lambda_function.create_category.last_modified
  }]
}

output "api_url" {
  value = aws_apigatewayv2_stage.this.invoke_url
}