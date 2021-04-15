resource "aws_eip" "registrator" {
  vpc = true

  tags = {
    Name = "registrator"
    app = "registrator"
    terraform = "registrator"
  }
}
