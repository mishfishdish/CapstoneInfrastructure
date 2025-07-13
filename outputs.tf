output "frontend_ip" {
  value = aws_eip.frontend_ip.public_ip
}

output "backend_ip" {
  value = aws_eip.backend_ip.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "frontend_url" {
  value = "http://frontend.capstoneapp.com"
}

output "backend_url" {
  value = "http://backend.capstoneapp.com"
}

output "frontend_ec2_private_key" {
  value     = tls_private_key.ec2.private_key_pem
  sensitive = true
}

output "frontend_ec2_public_key" {
  value = tls_private_key.ec2.public_key_openssh
}