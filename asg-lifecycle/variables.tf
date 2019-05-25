variable "region" {
  default = "us-west-2"
}

variable "name" {
}

variable "lifecycled_log_group" {
  default = "/aws/lifecycled"
}

variable "worker_asg" {
  type = list(string)
}

variable "worker_asg_count" {
}

variable "worker_iam_role" {
}

