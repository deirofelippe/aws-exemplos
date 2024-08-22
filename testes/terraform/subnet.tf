resource "aws_subnet" "this_public" {
  depends_on = [aws_internet_gateway.this]

  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "sa-east-1a"
  tags = {
    Name = "tutorial_subnet_public"
  }
}

resource "aws_subnet" "this_private_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "sa-east-1a"
  tags = {
    Name = "tutorial_subnet_private_1"
  }
}

resource "aws_subnet" "this_private_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "sa-east-1b"
  tags = {
    Name = "tutorial_subnet_private_2"
  }
}

resource "aws_subnet" "this_private_3" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "sa-east-1c"
  tags = {
    Name = "tutorial_subnet_private_3"
  }
}