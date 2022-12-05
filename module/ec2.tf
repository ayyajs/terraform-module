resource "aws_instance" "web_instance" {
  ami           = var.amiid
  instance_type = var.instance_type

  key_name      = aws_key_pair.kp.key_name
  
  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"    
    Name = var.instance_name
  }
}