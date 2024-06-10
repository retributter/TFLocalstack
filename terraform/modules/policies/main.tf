data "aws_iam_policy_document" "s3_access_policy" {
  statement {
    actions = ["s3:*"]
    resources = [
      var.s3_bucket_arn,
      "${var.s3_bucket_arn}/*"
    ]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "example" {
  name   = "example-policy"
  policy = data.aws_iam_policy_document.s3_access_policy.json
}

output "policy_arn" {
  value = aws_iam_policy.example.arn
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}