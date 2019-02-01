output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "state_bucket" {
  value = "${local.state_bucket}"
}

output "vpc_id" {
  value = "${data.terraform_remote_state.info.vpc_id}"
}
