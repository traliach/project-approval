variable "ami_id" {
  description = "The AMI ID for the Terraform node"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "The instance type for the Terraform node"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name for the Terraform node"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}
