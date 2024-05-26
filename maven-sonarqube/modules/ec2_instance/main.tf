resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = var.security_group_ids

  user_data = var.user_data
}

output "instance_id" {
  value = aws_instance.this.id
}
