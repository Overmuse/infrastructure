resource "aws_s3_bucket" "registrator_config" {
  bucket = "registrator-config"
  acl = "private"
  region = "us-east-1"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  tags = {
    Terraform = "registrator"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.registrator_config.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

output "bucket_id" {
  value = aws_s3_bucket.registrator_config.id
}

output "bucket_arn" {
  value = aws_s3_bucket.registrator_config.arn
}
