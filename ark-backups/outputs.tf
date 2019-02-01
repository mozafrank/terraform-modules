output "bucket_name" {
  value = "${aws_s3_bucket.backup_bucket.id}"
}

output "backup_user_access_key" {
  value = "${aws_iam_access_key.backup_access_key.id}"
}

output "backup_user_secret_key" {
  value = "${aws_iam_access_key.backup_access_key.secret}"
}
