variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
}

variable "user_data" {
  description = "The user data script to use for the instance"
  type        = string
}

variable "security_group_ids" {
  description = "The IDs of the security groups to attach to the instance"
  type        = list(string)
}
