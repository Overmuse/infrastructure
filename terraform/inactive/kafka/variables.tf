variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "instance_count" {
  type = map(string)

  default = {
    "broker"          = 3
    "zookeeper"       = 3
  }
}

variable "instance_prefix" {
  default     = "stage"
}

variable "aws_ami" {
  description = "The AWS AMI."
  default     = "ami-07ebfd5b3428b6f4d"
}

variable "aws_instance_type" {
  description = "The AWS Instance Type."
  default     = "t2.small"
}

variable "key_name" {
  description = "Key Pair"
  default     = "kafka"
}
