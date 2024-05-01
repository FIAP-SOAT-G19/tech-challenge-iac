
resource "aws_sqs_queue" "payment_queue" {
  name                       = var.queue_name
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
}

data "aws_iam_policy_document" "payment_queue_sqs_policy" {
  statement {
    sid    = "paymentqueuesqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.payment_queue.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "payment_queue_sqs_policy" {
  queue_url = aws_sqs_queue.payment_queue.id
  policy    = data.aws_iam_policy_document.payment_queue_sqs_policy.json
}
