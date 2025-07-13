resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key

  lifecycle {
    ignore_changes = [public_key]
  }
}

resource "aws_eip" "frontend_ip" {
  instance = aws_instance.frontend.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_eip" "backend_ip" {
  instance = aws_instance.backend.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_instance" "frontend" {
  ami                    = "ami-0df7a207adb9748c7"
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]

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

  lifecycle {
    ignore_changes = [ami, user_data]
  }
}

resource "aws_instance" "backend" {
  ami                    = "ami-0df7a207adb9748c7"
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.backend_sg.id]

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

  lifecycle {
    ignore_changes = [ami, user_data]
  }
}