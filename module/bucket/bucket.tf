resource "aws_s3_bucket" "prxm-s3-bucket" {
  bucket = "prxm-remote-state"
}

resource "aws_s3_bucket_versioning" "prxm-s3-bucket-acl-versioning" {
  bucket = aws_s3_bucket.prxm-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}