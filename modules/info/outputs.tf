output "vpc_id" {
  value = "${data.terraform_remote_state.deployment.vpc_id}"
}
