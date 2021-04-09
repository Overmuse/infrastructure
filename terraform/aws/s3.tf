resource "aws_s3_bucket" "terraform_state" {
    bucket = "overmuse-tf-state"

    versioning {
        enabled = true
    }
}
