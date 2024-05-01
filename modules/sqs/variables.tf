variable "region" {
  description = "The default region to use for the AWS provider"
  default     = "us-east-1"
}

variable "queue_name" {
  description = "The name of SQS QUEUE"
  default     = "payment_queue"
}
