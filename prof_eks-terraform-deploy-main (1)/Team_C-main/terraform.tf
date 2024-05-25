terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         = var.s3_bucket
    key            = "global/s3/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = var.dynamodb_table
  }
}
