terraform {
  backend "s3" {
    bucket   = "portolinux-terraform-state"
    role_arn = "arn:aws:iam::ACCOUNTID:role/OrganizationAccountAccessRole"
    acl      = "bucket-owner-full-control"
    key      = "portolinux/terraform.tfstate"
    region   = "eu-west-1"

  }
}

provider "aws" {
  region = "${var.region}"

  assume_role {
    role_arn     = "arn:aws:iam::ACCOUNTID:role/OrganizationAccountAccessRole"
    session_name = "portolinux"
  }
}
