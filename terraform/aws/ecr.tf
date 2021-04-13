resource "aws_ecr_repository" "tca" {
  name                 = "tca"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "timekeeper" {
  name                 = "timekeeper"
  image_tag_mutability = "IMMUTABLE"
}
