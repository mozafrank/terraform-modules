variable "region" {}

variable "backend" {
  default = "s3"
}

variable "state_bucket" {
  default = ""
}

variable "state_file" {
  default = "terraform/deploy"
}
