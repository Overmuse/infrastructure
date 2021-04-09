provider "aws" {
  region = "us-east-1"
}

terraform {
    backend "s3" {
        bucket = "overmuse-tf-state"
        key = "aws"
        region = "us-east-1"
    }
}

