locals {
  home_cidr = ["71.105.182.5/32"]
}

resource "aws_security_group" "kafka" {
    name = "kafka"

    tags = {
        Terraform = "true"
        Name = "kafka"
        app = "kafka"
    }
}

resource "aws_security_group_rule" "egress_all" {
    security_group_id = aws_security_group.kafka.id

    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "_ingress_home_ssh" {
    security_group_id = aws_security_group.kafka.id

    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = local.home_cidr
}

resource "aws_security_group" "zookeeper" {
    name = "zookeeper"

    tags = {
        Terraform = "true"
        Name = "zookeeper"
        app = "kafka"
    }
}

resource "aws_security_group_rule" "_ingress_zookeeper_client" {
    security_group_id = aws_security_group.zookeeper.id

    type = "ingress"
    from_port = 2181
    to_port = 2181
    protocol = "tcp"
    source_security_group_id = aws_security_group.broker.id
}

resource "aws_security_group_rule" "_ingress_zookeeper_follower" {
    security_group_id = aws_security_group.zookeeper.id

    type = "ingress"
    from_port = 2888
    to_port = 2888
    protocol = "tcp"
    self = true
}

resource "aws_security_group_rule" "_ingress_zookeeper_leader_election" {
    security_group_id = aws_security_group.zookeeper.id

    type = "ingress"
    from_port = 3888
    to_port = 3888
    protocol = "tcp"
    self = true
}

resource "aws_security_group" "broker" {
    name = "broker"

    tags = {
        Terraform = "true"
        Name = "broker"
        app = "kafka"
    }
}

resource "aws_security_group_rule" "_ingress_broker" {
    security_group_id = aws_security_group.broker.id

    type = "ingress"
    from_port = 9092
    to_port = 9092
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
