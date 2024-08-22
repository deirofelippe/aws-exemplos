resource "aws_db_subnet_group" "this" {
  name = "db_subnet_group"
  subnet_ids = [
    aws_subnet.this_private_1.id,
    aws_subnet.this_private_2.id,
    aws_subnet.this_private_3.id
  ]
}

resource "aws_db_instance" "this" {
  allocated_storage      = 5
  db_name                = "tutorialrds"
  engine                 = "mysql"
  engine_version         = "8.0.33"
  instance_class         = "db.t2.micro"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible    = false
  multi_az               = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.allow_mysql.id]
  db_subnet_group_name   = aws_db_subnet_group.this.name
  tags = {
    Name = "tutorial_rds"
  }
}