output "queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.payment_queue.id, "")
}

output "queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.payment_queue.url, "")
}

output "queue_name" {
  description = "The name of the SQS queue"
  value       = try(aws_sqs_queue.payment_queue.name, "")
}
