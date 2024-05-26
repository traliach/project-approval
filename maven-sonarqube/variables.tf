variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
  default     = "production"
}

variable "ami" {
  description = "The AMI ID to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instances"
  type        = string
  default     = "t2.medium"
}

variable "jenkins_instance_name" {
  description = "The name tag for the Jenkins instance"
  type        = string
}

variable "terraform_sonarqube_instance_name" {
  description = "The name tag for the Terraform and SonarQube instance"
  type        = string
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
}

variable "sg_description" {
  description = "The description of the security group"
  type        = string
}

variable "ingress_rules" {
  description = "The ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "The egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
