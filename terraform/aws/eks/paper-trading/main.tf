terraform {
    backend "s3" {
        bucket = "overmuse-tf-state"
        key = "paper-trading-eks"
        region = "us-east-1"
    }
}

