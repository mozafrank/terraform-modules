variable "region" {
  default = "us-west-2"
}

variable "name" {}

variable "lifecycled_log_group" {
  default = "/aws/lifecycled"
}

variable "asg_names" {
  type = "list"
}

variable "worker_iam_role" {}
