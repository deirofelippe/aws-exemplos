resource "aws_key_pair" "this" {
  key_name   = "tutorial_ec2_key"
  public_key = file("~/.ssh/aws-test.pub")
  tags = {
    Name = "tutorial_ec2_key"
  }
}

resource "aws_instance" "this" {
  ami                    = "ami-0af6e9042ea5a4e3e"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.this.key_name
  subnet_id              = aws_subnet.this.id
  vpc_security_group_ids = [aws_security_group.allow_api.id]
  depends_on             = [aws_internet_gateway.this]
  tags = {
    Name = "tutorial_ec2"
  }
}
