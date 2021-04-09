resource "aws_instance" "broker" {
    count = var.instance_count["broker"]
    ami = var.aws_ami
    instance_type = var.aws_instance_type
    iam_instance_profile = aws_iam_instance_profile.broker.name
    key_name = var.key_name
    vpc_security_group_ids = [
        aws_security_group.kafka.id,
        aws_security_group.broker.id
    ]

    root_block_device {
        encrypted = true
    }

    user_data = templatefile("files/broker_cloud_init.yml", { bucket = aws_s3_bucket.kafka_broker_config.id})

    tags = {
        Name = "kafka-broker-${var.instance_prefix}-${format("%02d", count.index+1)}"
    }
}

resource "aws_instance" "zookeeper" {
    count = var.instance_count["zookeeper"]
    ami = var.aws_ami
    instance_type = var.aws_instance_type
    iam_instance_profile = aws_iam_instance_profile.zookeeper.name
    key_name = var.key_name
    vpc_security_group_ids = [
        aws_security_group.kafka.id,
        aws_security_group.zookeeper.id
    ]

    user_data = templatefile("files/zookeeper_cloud_init.yml", { bucket = aws_s3_bucket.zookeeper_config.id})

    tags = {
        Name = "kafka-zookeeper-${var.instance_prefix}-${format("%02d", count.index+1)}"
    }
}
