data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    principals {
      type        = "Federated"
      identifiers = [var.oidc_audience_arn]
    }

    condition {
      test     = "StringEquals"
      values   = var.federated_service_account
      variable = "${var.oidc_subject}:sub"
    }
  }
}

resource "aws_iam_role" "this" {
  name                 = "${var.tenant}-${var.stage}-irsa-test"
  assume_role_policy   = data.aws_iam_policy_document.this.json
  description          = "All backed services role which would be delegated through saml"
  max_session_duration = "43200"
  tags =  {
    Name = "${var.tenant}-${var.stage}-irsa"
  }
}

# resource "aws_iam_role_policy_attachment" "this" {
#   role       = aws_iam_role.this.name
#   policy_arn = aws_iam_policy.this.arn
# }