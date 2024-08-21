resource "aws_dynamodb_table" "this" {
  name         = local.namespaced_service_name
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"

  # read_capacity  = 20
  # write_capacity = 20
  # range_key      = "GameTitle"

  attribute {
    name = "id"
    type = "S"
  }

  # attribute {
  #   name = "GameTitle"
  #   type = "S"
  # }

  # attribute {
  #   name = "TopScore"
  #   type = "N"
  # }

  # ttl {
  #   attribute_name = "TimeToExist"
  #   enabled        = true
  # }

  # global_secondary_index {
  #   name               = "GameTitleIndex"
  #   hash_key           = "GameTitle"
  #   range_key          = "TopScore"
  #   write_capacity     = 10
  #   read_capacity      = 10
  #   projection_type    = "INCLUDE"
  #   non_key_attributes = ["UserId"]
  # }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

resource "aws_dynamodb_table_item" "this" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key

  item = <<ITEM
    {
      "id": {"N": "1"},
      "task": {"S": "dar like no video"},
      "done": {"B": "false"},
    }
  ITEM
}