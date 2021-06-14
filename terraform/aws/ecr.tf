resource "aws_ecr_repository" "alpaca-data-relay" {
  name                 = "alpaca-data-relay"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "double-trouble" {
  name                 = "double-trouble"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "double-trouble-jl" {
  name                 = "double-trouble-jl"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "jump-diffusion" {
  name                 = "jump-diffusion"
  image_tag_mutability = "IMMUTABLE"
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
