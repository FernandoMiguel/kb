terraform {
}

provider "aws" {
  region = "${var.region}"

  assume_role {
    role_arn     = "arn:aws:iam::ACCOUNTID:role/OrganizationAccountAccessRole"
    session_name = "portolinux"
  }
}
