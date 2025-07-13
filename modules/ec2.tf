resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_eip" "frontend_ip" {
  instance = aws_instance.frontend.id
}

resource "aws_eip" "backend_ip" {
  instance = aws_instance.backend.id
}

resource "aws_instance" "frontend" {
  ami                         = "ami-0cfd0973db26b893b"
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              EOF

  tags = {
    Name = "FrontendServer"
  }
}

resource "aws_instance" "backend" {
  ami                         = "ami-0cfd0973db26b893b"
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.backend_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              EOF

  tags = {
    Name = "BackendServer"
  }
}