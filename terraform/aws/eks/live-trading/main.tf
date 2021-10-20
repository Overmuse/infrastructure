terraform {
    backend "s3" {
        bucket = "overmuse-tf-state"
        key = "live-trading-eks"
        region = "us-east-1"
    }
}

