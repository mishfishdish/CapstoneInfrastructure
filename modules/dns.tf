resource "null_resource" "update_duckdns_frontend" {
  triggers = {
    frontend_ip = aws_eip.frontend_ip.public_ip
  }

  provisioner "local-exec" {
    command = "curl -s \"https://www.duckdns.org/update?domains=capstoneapp-frontend&token=${var.duckdns_token}&ip=${aws_eip.frontend_ip.public_ip}\""
  }
}

resource "null_resource" "update_duckdns_backend" {
  triggers = {
    backend_ip = aws_eip.backend_ip.public_ip
  }

  provisioner "local-exec" {
    command = "curl -s \"https://www.duckdns.org/update?domains=capstoneapp-backend&token=${var.duckdns_token}&ip=${aws_eip.backend_ip.public_ip}\""
  }
}