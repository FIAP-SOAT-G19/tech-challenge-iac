data "aws_iam_policy_document" "created_sqs_policy" {
  statement {
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
      aws_sqs_queue.created_order_queue.arn
    ]
  }
}

resource "aws_sqs_queue" "created_order_queue" {
  name                        = "created_order.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue_policy" "created_order_queue_sqs_policy" {
  queue_url = aws_sqs_queue.created_order_queue.id
  policy    = data.aws_iam_policy_document.created_sqs_policy.json
}

data "aws_iam_policy_document" "approved_sqs_policy" {
  statement {
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
      aws_sqs_queue.approved_payment_queue.arn
    ]
  }
}

resource "aws_sqs_queue" "approved_payment_queue" {
  name                        = "approved_payment.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue_policy" "approved_payment_queue_sqs_policy" {
  queue_url = aws_sqs_queue.approved_payment_queue.id
  policy    = data.aws_iam_policy_document.approved_sqs_policy.json
}

data "aws_iam_policy_document" "unauthorized_sqs_policy" {
  statement {
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
      aws_sqs_queue.unauthorized_payment_queue.arn
    ]
  }
}

resource "aws_sqs_queue" "unauthorized_payment_queue" {
  name                        = "unauthorized_payment.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue_policy" "unauthorized_payment_queue_sqs_policy" {
  queue_url = aws_sqs_queue.unauthorized_payment_queue.id
  policy    = data.aws_iam_policy_document.unauthorized_sqs_policy.json
}

data "aws_iam_policy_document" "update_sqs_policy" {
  statement {
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
      aws_sqs_queue.update_order.arn
    ]
  }
}

resource "aws_sqs_queue" "update_order" {
  name                        = "update_order.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue_policy" "update_order_sqs_policy" {
  queue_url = aws_sqs_queue.update_order.id
  policy    = data.aws_iam_policy_document.update_sqs_policy.json
}
