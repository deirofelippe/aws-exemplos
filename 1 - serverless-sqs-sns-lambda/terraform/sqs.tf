resource "aws_sqs_queue" "this" {
  name   = "OrdersQueue"
  policy = <<EOT
    { 
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "SQS:*"
          ],
          "Effect": "Allow",
          "Resource": "arn:aws:sqs:sa-east-1:*:OrdersQueue"
        }
      ]
    }
  EOT

  tags = {
    Name        = "OrdersQueue"
    Environment = "development"
  }
}