data "aws_caller_identity" "current" {}

locals {
  state_bucket = "${var.state_bucket == "" ? "deploy-state-${data.aws_caller_identity.current.account_id}" : var.state_bucket}"
}

data terraform_remote_state "info" {
  backend = "${var.backend}"

  config = {
    bucket = "${local.state_bucket}"
    key    = "${var.state_file}"
    region = "${var.region}"
  }
}
