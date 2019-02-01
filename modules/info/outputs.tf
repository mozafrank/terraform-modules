output "vpc_id" {
  value = "${data.terraform_remote_state.deployment.deployment.vpc_id}"
}
