resource "aws_ecr_repository" "frontend" {
  name = "frontend-app"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "frontend-app"
  }
}

resource "aws_ecr_repository" "backend" {
  name = "backend-app"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "backend-app"
  }
}