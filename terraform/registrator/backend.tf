provider "aws" {
	region = "us-east-1"
}

terraform {
	required_version = "0.12.24"

	backend "s3" {
		bucket = "account-tf-state"
		key = "registrator.tfstate"
		region = "us-east-1"
		#dynamodb_table = "account-tfstate"
		encrypt = true
	}
}
