region        = "eu-west-2"
key_name      = "production"
ami           = "ami-053a617c6207ecc7b"
instance_type = "t2.medium"

ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

sg_name        = "common_sg"
sg_description = "Security group for Jenkins, Terraform, and SonarQube instances"

# Instance Names
jenkins_instance_name             = "Jenkins"
terraform_sonarqube_instance_name = "Terraform-SonarQube"
