#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "paper-trading" {
  cidr_block = "10.0.0.0/16"

  tags = tomap({
    "Name"="paper-trading-node",
    "kubernetes.io/cluster/${var.cluster-name}"="shared",
  })
}

resource "aws_subnet" "paper-trading" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.paper-trading.id

  tags = tomap({
    "Name"="paper-trading-node",
    "kubernetes.io/cluster/${var.cluster-name}"="shared",
  })
}

resource "aws_internet_gateway" "paper-trading" {
  vpc_id = aws_vpc.paper-trading.id

  tags = {
    Name = "terraform-eks-paper-trading"
  }
}

resource "aws_route_table" "paper-trading" {
  vpc_id = aws_vpc.paper-trading.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.paper-trading.id
  }
}

resource "aws_route_table_association" "paper-trading" {
  count = 2

  subnet_id      = aws_subnet.paper-trading.*.id[count.index]
  route_table_id = aws_route_table.paper-trading.id
}
