output "vpc_id" {
  value = "${data.terraform_remote_state.info.vpc_id}"
}
