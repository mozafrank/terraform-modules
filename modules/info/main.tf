data "aws_caller_identity" "current" {}

locals {
  state_bucket = "deploy-state-${data.aws_caller_identity.current.account_id}"
}

data "terrafrom_remote_state" "deployment" {
  backend = "${var.backend}"

  config = {
    bucket = "${local.state_bucket}"
    name   = "terraform/deploy"
  }
}
