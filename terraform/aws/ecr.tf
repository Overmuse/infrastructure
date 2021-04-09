resource "aws_ecr_repository" "tca" {
  name                 = "tca"
  image_tag_mutability = "IMMUTABLE"
}
