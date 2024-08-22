resource "aws_key_pair" "this" {
  key_name   = "exemplo2_ec2_key"
  public_key = file("~/.ssh/aws_key.pub")
  
  tags = {
    Name = var.tag_name
  }
}

resource "aws_instance" "this" {
  ami                    = "ami-0c5410a9e09852edd"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.this.key_name
  subnet_id              = aws_subnet.this.id
  vpc_security_group_ids = [aws_security_group.allow_api.id]
  depends_on             = [aws_internet_gateway.this]

  tags = {
    Name = var.tag_name
  }
}