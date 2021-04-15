resource "aws_iam_role_policy_attachment" "instance_registrator" {
  role = aws_iam_role.registrator.name
  policy_arn = aws_iam_policy.registrator.arn
}

resource "aws_iam_instance_profile" "registrator" {
  name = "instance_registrator"
  role = aws_iam_role.registrator.name
}

resource "aws_iam_role" "registrator" {
  name = "instance_registrator"
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

resource "aws_iam_policy" "registrator" {
  name = "instance_registrator"
  path = "/"
  description = "Required config and secret access for the registrator"

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
        "${aws_s3_bucket.registrator_config.arn}/*",
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
        "${aws_s3_bucket.registrator_config.arn}/*",
	"arn:aws:s3:::aiaia-dev-tools/*"
      ]
    },
    {
      "Sid": "AllowSecretsForJulia",
      "Effect": "Allow",
      "Action": [
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds"
      ],
      "Resource": [
        "arn:aws:secretsmanager:us-east-1:${data.aws_caller_identity.current.account_id}:secret:registrator/*"
      ]
    }
  ]
}
EOF
}
