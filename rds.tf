resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14.9"
  instance_class         = "db.t3.micro"
  db_name                = "capstonedb"
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  lifecycle {
    ignore_changes = [
      engine_version,
      password,
      publicly_accessible
    ]
    prevent_destroy = true
  }
}