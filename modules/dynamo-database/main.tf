resource "aws_dynamodb_table" "users" {
  name           = "users"
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "cpf"

  attribute {
    name = "cpf"
    type = "S"
  }
}

resource "aws_dynamodb_table" "production" {
  name           = "production"
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "orderNumber"

  attribute {
    name = "orderNumber"
    type = "S"
  }
}
