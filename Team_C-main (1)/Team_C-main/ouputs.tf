output "jenkins_server_public_ip" {
  description = "Public IP address of the Jenkins server"
  value       = module.jenkins_server.jenkins_server_public_ip
}

output "terraform_node_public_ip" {
  description = "Public IP address of the Terraform node"
  value       = module.terraform_node.terraform_node_public_ip
}

output "s3_bucket" {
  description = "Name of the S3 bucket for Terraform state"
  value       = module.s3_dynamodb.bucket
}

output "dynamodb_table" {
  description = "Name of the DynamoDB table for state locking"
  value       = module.s3_dynamodb.table
}
