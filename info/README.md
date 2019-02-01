## Info module
Spits out some information based on state file you specify

## Usage

```bash
module "info" {
	source = "github.com/limed/terraform-modules//info?ref=master"
	region = "us-west-2"
}

output "vpc_id" {
	value = "${module.info.vpc_id}"
}
```
