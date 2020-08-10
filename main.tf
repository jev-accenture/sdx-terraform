# Configure the AWS Provider
provider "aws" {
  # credentials configuration should be provided through AWS configure
  profile = "default"
  region  = "eu-central-1"
}

data "aws_caller_identity" "current" {}

locals {
  default_tags = "${map(
        "project", "Bootcamp",
        "department", "Cloud and Automation",
        "owner", "${element(split("/",data.aws_caller_identity.current.arn),1)}"
      )}"
}

