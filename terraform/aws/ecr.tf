resource "aws_ecr_repository" "alpaca-data-relay" {
  name                 = "alpaca-data-relay"
  image_tag_mutability = "IMMUTABLE"
}

resouce "aws_ecr_lifecycle_policy" "alpaca-data-relay-policy" {
    repository = aws_ecr_repository.alpaca-data-relay.name

    policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Only keep last 3 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

resource "aws_ecr_repository" "double-trouble" {
  name                 = "double-trouble"
  image_tag_mutability = "IMMUTABLE"
}

resouce "aws_ecr_lifecycle_policy" "double-trouble-policy" {
    repository = aws_ecr_repository.double-trouble.name

    policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Only keep last 3 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

resource "aws_ecr_repository" "double-trouble-jl" {
  name                 = "double-trouble-jl"
  image_tag_mutability = "IMMUTABLE"
}

resouce "aws_ecr_lifecycle_policy" "double-trouble-jl-policy" {
    repository = aws_ecr_repository.double-trouble-jl.name

    policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Only keep last 3 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

resource "aws_ecr_repository" "jump-diffusion" {
  name                 = "jump-diffusion"
  image_tag_mutability = "IMMUTABLE"
}

resouce "aws_ecr_lifecycle_policy" "jump-diffusion-policy" {
    repository = aws_ecr_repository.jump-diffusion.name

    policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Only keep last 3 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

resource "aws_ecr_repository" "microprice" {
  name                 = "microprice"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "order-manager" {
  name                 = "order-manager"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "polygon-data-relay" {
  name                 = "polygon-data-relay"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "reporting" {
  name                 = "reporting"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "tca" {
  name                 = "tca"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "timekeeper" {
  name                 = "timekeeper"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "trader" {
  name                 = "trader"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "volatility-harvesting" {
  name                 = "volatility-harvesting"
  image_tag_mutability = "IMMUTABLE"
}
