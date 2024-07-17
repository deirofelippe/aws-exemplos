resource "aws_iam_role" "create_category_lambda" {
  name               = "create-category-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json

  tags = local.common_tags
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "create_logs_cloudwatch" {
  statement {
    sid       = "AllowCreatingLogGroups"
    effect    = "Allow"
    resources = ["arn:aws:logs:*:*:*"]
    actions   = ["logs:CreateLogGroup"]
  }

  statement {
    sid       = "AllowWritingLogs"
    effect    = "Allow"
    resources = ["arn:aws:logs:*:*:log-group:/aws/lambda/*:*"]
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "dynamodb:ListTables", 
      "ssm:DescribeParameters",
      "xray:PutTraceSegments"
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["arn:aws:dynamodb:${var.aws_region}:${var.aws_account_id}:table/${aws_dynamodb_table.this.name}"]
    actions = [
      "dynamodb:PutItem", 
      "dynamodb:DescribeTable", 
      "dynamodb:DeleteItem", 
      "dynamodb:GetItem", 
      "dynamodb:Scan", 
      "dynamodb:Query",
      "dynamodb:UpdateItem"
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${aws_ssm_parameter.dynamodb_table.name}"]
    actions = [
      "ssm:GetParameters", 
      "ssm:GetParameter"
    ]
  }
}

resource "aws_iam_policy" "create_logs_cloudwatch" {
  name   = "create-cloudwatch-logs-policy"
  policy = data.aws_iam_policy_document.create_logs_cloudwatch.json

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "create_category_cloudwatch" {
  policy_arn = aws_iam_policy.create_logs_cloudwatch.arn
  role       = aws_iam_role.create_category_lambda.name
}
