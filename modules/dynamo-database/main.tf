resource "aws_dynamodb_table" "users" {
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key_and_atribute_name

  attribute {
    name = var.hash_key_and_atribute_name
    type = "S"
  }
}
