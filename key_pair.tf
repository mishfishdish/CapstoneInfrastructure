# Generate a new RSA private key
resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS EC2 key pair using the public part of the key
resource "aws_key_pair" "frontend_key" {
  key_name   = "capstone-frontend-key"
  public_key = tls_private_key.ec2.public_key_openssh
}