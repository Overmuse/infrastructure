locals {

  github = [
    "192.30.252.0/22",
    "185.199.108.0/22",
    "140.82.112.0/20",
    "13.209.163.61/32",
    "13.230.158.120/32",
    "13.233.76.15/32",
    "13.234.168.60/32",
    "13.236.14.80/32",
    "13.238.54.232/32",
    "13.250.168.23/32",
    "13.250.94.254/32",
    "18.179.245.253/32",
    "18.194.201.191/32",
    "18.195.135.122/32",
    "18.229.119.202/32",
    "18.229.199.252/32",
    "52.58.203.252/32",
    "52.63.231.178/32",
    "52.69.239.207/32",
    "54.169.195.247/32",
    "54.180.75.25/32",
    "54.207.47.76/32"
  ]

  home_cidr = ["71.105.182.5/32"]
}

resource "aws_security_group" "registrator" {
  name = "registrator"

  tags = {
    Terraform = "true"
    Name = "registrator"
    app = "registrator"
  }
}

resource "aws_security_group_rule" "egress_all" {
  security_group_id = aws_security_group.registrator.id

  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "_ingress_home_ssh" {
  security_group_id = aws_security_group.registrator.id

  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"

  cidr_blocks = local.home_cidr
}

resource "aws_security_group_rule" "_ingress_home_commentbot" {
  security_group_id = aws_security_group.registrator.id

  type = "ingress"
  from_port = 8081
  to_port = 8081
  protocol = "tcp"

  cidr_blocks = local.home_cidr
}

resource "aws_security_group_rule" "_ingress_github_commentbot" {
  security_group_id = aws_security_group.registrator.id

  type = "ingress"
  from_port = 8081
  to_port = 8081
  protocol = "tcp"

  cidr_blocks = local.github
}
