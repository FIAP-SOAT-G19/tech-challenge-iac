variable "region" {
  description = "The default region to use for the AWS provider"
  default     = "us-east-1"
}

variable "read_capacity" {
  description = "The read capacity for the DynamoDB table"
  default     = 20
}

variable "write_capacity" {
  description = "The write capacity for the DynamoDB table"
  default     = 20
}
