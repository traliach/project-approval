provider "aws" {
  region = var.aws_region
}

module "jenkins_server" {
  source       = "./jenkins-server"
  ami_id       = var.ami_id
  instance_type = var.instance_type
  key_name     = var.key_name
  aws_region   = var.aws_region
}

module "terraform_node" {
  source       = "./terraform_node"
  ami_id       = var.ami_id
  instance_type = var.instance_type
  key_name     = var.key_name
  aws_region   = var.aws_region
}

module "s3_dynamodb" {
  source  = "./s3-dynamodb"
  bucket  = var.s3_bucket
  table   = var.dynamodb_table
  region  = var.aws_region
}
