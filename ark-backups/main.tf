data "aws_caller_identity" "current" {
}

locals {
  backup_bucket = "${var.bucket_name}-${var.cluster_name}-${data.aws_caller_identity.current.account_id}"
  backup_user   = "${var.backup_user}-${var.cluster_name}"
}

resource "aws_s3_bucket" "backup_bucket" {
  bucket = local.backup_bucket
  acl    = "private"

  tags = {
    Name      = local.backup_bucket
    Region    = var.region
    Cluster   = var.cluster_name
    Service   = "Backups"
    Terraform = "true"
  }
}

resource "aws_iam_user" "backup_user" {
  name = local.backup_user

  tags = {
    Name      = local.backup_user
    Cluster   = var.cluster_name
    Service   = "Backups"
    Terraform = "True"
  }
}

resource "aws_iam_access_key" "backup_access_key" {
  user = aws_iam_user.backup_user.name
}

data "template_file" "policy" {
  template = file("${path.module}/tmpl/policy.json")

  vars = {
    bucket_name = aws_s3_bucket.backup_bucket.id
  }
}

resource "aws_iam_user_policy" "backup_user_policy" {
  name = "${local.backup_user}-policy"
  user = aws_iam_user.backup_user.name

  policy = data.template_file.policy.rendered
}

