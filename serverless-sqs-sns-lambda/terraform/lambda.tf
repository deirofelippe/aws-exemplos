
resource "aws_lambda_function" "category" {
  for_each = local.lambdas

  function_name = "${each.key}-category"
  # s3_bucket = aws_s3_bucket.lambda_bucket.id
  # s3_key    = aws_s3_object.lambda_hello_world.key
  handler     = "${each.key}.handler"
  description = each.value["description"]
  role        = aws_iam_role.create_category_lambda.arn
  runtime     = "nodejs20.x"

  filename         = data.archive_file.category[each.key].output_path
  source_code_hash = data.archive_file.category[each.key].output_base64sha256

  timeout     = each.value["timeout"]
  memory_size = each.value["memory"]

  layers = [
    aws_lambda_layer_version.got.arn
  ]

  tags = local.common_tags

  tracing_config {
    mode = "Active"
  }

  environment {
    variables = {
      TABLE = aws_ssm_parameter.dynamodb_table.name
      DEBUG = var.env == "dev"
    }
  }
}

resource "aws_lambda_permission" "api" {
  for_each = local.lambdas

  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.category[each.key].arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.aws_account_id}:*/*"
}

data "archive_file" "create_category_artefact" {
  source_file = "${local.lambdas_path}/index.js"
  type        = "zip"
  output_path = "files/create_category_artefact.zip"
}

data "archive_file" "category" {
  for_each = local.lambdas

  source_file = "${local.lambdas_path}/category/${each.key}.js"
  type        = "zip"
  output_path = "files/${each.key}-category-artefact.zip"
}