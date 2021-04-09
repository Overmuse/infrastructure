resource "aws_s3_bucket" "kafka_broker_config" {
  bucket = "kafka-broker-config"
  acl = "private"

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
    Terraform = "kafka"
  }
}

resource "aws_s3_bucket_public_access_block" "broker_bucket" {
  bucket = aws_s3_bucket.kafka_broker_config.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

output "broker_bucket_id" {
  value = aws_s3_bucket.kafka_broker_config.id
}

output "broker_bucket_arn" {
  value = aws_s3_bucket.kafka_broker_config.arn
}

resource "aws_s3_bucket" "zookeeper_config" {
  bucket = "kafka-zookeeper-config"
  acl = "private"

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
    Terraform = "zookeeper"
  }
}

resource "aws_s3_bucket_public_access_block" "zookeeper_bucket" {
  bucket = aws_s3_bucket.zookeeper_config.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

output "zookeeper_bucket_id" {
  value = aws_s3_bucket.zookeeper_config.id
}

output "zookeeper_bucket_arn" {
  value = aws_s3_bucket.zookeeper_config.arn
}
