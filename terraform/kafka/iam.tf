resource "aws_iam_role_policy_attachment" "instance_broker" {
  role = aws_iam_role.broker.name
  policy_arn = aws_iam_policy.broker.arn
}

resource "aws_iam_instance_profile" "broker" {
  name = "instance_broker"
  role = aws_iam_role.broker.name
}

resource "aws_iam_role" "broker" {
  name = "instance_broker"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "broker" {
  name = "instance_broker"
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetsInBucket",
      "Effect": "Allow",
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObject"
      ],
      "Resource": [
        "${aws_s3_bucket.kafka_broker_config.arn}/*",
	      "arn:aws:s3:::aiaia-dev-tools/*"
      ]
    },
    {
      "Sid": "AllowListBucket",
      "Effect": "Allow",
      "Action": [
        "s3:ListBucketVersions",
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.kafka_broker_config.arn}/*",
	      "arn:aws:s3:::aiaia-dev-tools/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "instance_zookeeper" {
  role = aws_iam_role.zookeeper.name
  policy_arn = aws_iam_policy.zookeeper.arn
}

resource "aws_iam_instance_profile" "zookeeper" {
  name = "instance_zookeeper"
  role = aws_iam_role.zookeeper.name
}

resource "aws_iam_role" "zookeeper" {
  name = "instance_zookeeper"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "zookeeper" {
  name = "instance_zookeeper"
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetsInBucket",
      "Effect": "Allow",
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObject"
      ],
      "Resource": [
        "${aws_s3_bucket.zookeeper_config.arn}/*",
	      "arn:aws:s3:::aiaia-dev-tools/*"
      ]
    },
    {
      "Sid": "AllowListBucket",
      "Effect": "Allow",
      "Action": [
        "s3:ListBucketVersions",
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.zookeeper_config.arn}/*",
	      "arn:aws:s3:::aiaia-dev-tools/*"
      ]
    }
  ]
}
EOF
}
