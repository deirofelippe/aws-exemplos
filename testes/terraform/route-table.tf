resource "aws_route_table" "this_public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "tutorial_rt_public"
  }
}

resource "aws_route_table_association" "this_assoc_public" {
  subnet_id      = aws_subnet.this_public.id
  route_table_id = aws_route_table.this_public.id
}

resource "aws_route_table" "this_private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "tutorial_rt_private"
  }
}

resource "aws_route_table_association" "this_private_1" {
  subnet_id      = aws_subnet.this_private_1.id
  route_table_id = aws_route_table.this_private.id
}

resource "aws_route_table_association" "this_private_2" {
  subnet_id      = aws_subnet.this_private_2.id
  route_table_id = aws_route_table.this_private.id
}

resource "aws_route_table_association" "this_private_3" {
  subnet_id      = aws_subnet.this_private_3.id
  route_table_id = aws_route_table.this_private.id
}
