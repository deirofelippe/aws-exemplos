resource "aws_eip" "this_ec2" {
  depends_on = [aws_internet_gateway.this]

  instance                  = aws_instance.this.id
  associate_with_private_ip = aws_instance.this.private_ip
  tags = {
    Name = "tutorial_eip_ec2"
  }
}

resource "aws_eip" "this_ngw" {
  depends_on = [aws_internet_gateway.this]

  tags = {
    Name = "tutorial_eip_ngw"
  }
}