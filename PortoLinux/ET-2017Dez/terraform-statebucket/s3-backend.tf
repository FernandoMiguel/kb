resource "aws_s3_bucket" "default" {
  bucket        = "portolinux-terraform-state"
  acl           = "private"
  region        = "${var.region}"

  versioning {
    enabled = "true"
  }
}