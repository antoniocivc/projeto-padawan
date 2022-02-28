resource "aws_s3_bucket" "remote-state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = local.common_tags
}