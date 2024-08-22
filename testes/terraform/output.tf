output "s3_website_endpoint" {
  value = aws_s3_bucket_website_configuration.this.website_endpoint
}

output "ec2_public_ip" {
  value = aws_instance.this.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.this.public_dns
}