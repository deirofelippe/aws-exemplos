resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "tutorial_igw"
  }
}

resource "aws_nat_gateway" "this" {
  subnet_id     = aws_subnet.this_public.id
  allocation_id = aws_eip.this_ngw.id

  tags = {
    Name = "tutorial_ngw"
  }
  depends_on = [aws_internet_gateway.this]
}
