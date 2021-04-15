resource "aws_instance" "registrator" {
  ami = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.small"
  iam_instance_profile = aws_iam_instance_profile.registrator.name

  vpc_security_group_ids = [
    aws_security_group.registrator.id
  ]

  root_block_device {
    encrypted = true
  }

  user_data = templatefile("files/cloud_init.yml", { bucket = aws_s3_bucket.registrator_config.id})
  key_name = "registrator"

  tags = {
    Name = "registrator"
    app = "registrator"
    terraform = "registrator"
  }

  depends_on = [aws_s3_bucket_object.bootstrap]
}

resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.registrator.id
  allocation_id = aws_eip.registrator.id
}

output "eip" {
  value = aws_eip.registrator.public_ip
}

output "instance_id" {
  value = aws_instance.registrator.id
}
