# Configure the AWS Provider
provider "aws" {
  # configuration should be provided through environment variables
}

data "aws_caller_identity" "current" {}

locals {
  default_tags = "${map(
        "project", "Bootcamp",
        "department", "Cloud and Automation",
        "owner", "${element(split("/",data.aws_caller_identity.current.arn),1)}"
      )}"
}

