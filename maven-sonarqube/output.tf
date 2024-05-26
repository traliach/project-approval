output "jenkins_instance_id" {
  value = aws_instance.jenkins1.id
}

output "jenkins_instance_public_ip" {
  value = aws_instance.jenkins1.public_ip
}

output "terraform_sonarqube_instance_id" {
  value = aws_instance.terraform_sonarqube.id
}

output "terraform_sonarqube_instance_public_ip" {
  value = aws_instance.terraform_sonarqube.public_ip
}

output "security_group_id" {
  value = aws_security_group.sg.id
}
