#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "live-trading" {
  cidr_block = "10.0.0.0/16"

  tags = tomap({
    "Name"="live-trading-node",
    "kubernetes.io/cluster/${var.cluster-name}"="shared",
  })
}

resource "aws_subnet" "live-trading" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.live-trading.id

  tags = tomap({
    "Name"="live-trading-node",
    "kubernetes.io/cluster/${var.cluster-name}"="shared",
  })
}

resource "aws_internet_gateway" "live-trading" {
  vpc_id = aws_vpc.live-trading.id

  tags = {
    Name = "terraform-eks-live-trading"
  }
}

resource "aws_route_table" "live-trading" {
  vpc_id = aws_vpc.live-trading.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.live-trading.id
  }
}

resource "aws_route_table_association" "live-trading" {
  count = 2

  subnet_id      = aws_subnet.live-trading.*.id[count.index]
  route_table_id = aws_route_table.live-trading.id
}
