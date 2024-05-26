resource "aws_dynamodb_table" "terraform_state_locking" {
  name           = "terraform-state-locking"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "lockID"
  range_key      = "Digest"

  attribute {
    name = "lockID"
    type = "S"
  }

  attribute {
    name = "Digest"
    type = "S"
  }

  attribute {
    name = "ResourceType"
    type = "S"
  }

  attribute {
    name = "Timestamp"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  global_secondary_index {
    name               = "ResourceTypeIndex"
    hash_key           = "ResourceType"
    range_key          = "Timestamp"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["lockID", "Digest"]
  }

  tags = {
    Name        = "terraform-state-locking"
    Environment = "dev"
  }
}
