# VPC
resource "aws_vpc" "burgasm_vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "burgasm_vpc"
  }
}

# SUBNETS

resource "aws_subnet" "burgasm-subnet" {
  count             = "${length(var.subnet_cidr)}"
  vpc_id            = "${aws_vpc.burgasm_vpc.id}"
  availability_zone = "${element(var.azs, count.index)}"
  cidr_block        = "${element(var.subnet_cidr, count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "burgasm-public-${count.index + 1}"
  }
}

# IGW

resource "aws_internet_gateway" "burgasm-IGW" {
  vpc_id = "${aws_vpc.burgasm_vpc.id}"

  tags = {
    Name = "burgasm-IGW"
  }
}

# ROUTE TABLES

resource "aws_route_table" "burgasm-rt" {
  vpc_id = "${aws_vpc.burgasm_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.burgasm-IGW.id}"
  }

  tags = {
    Name = "burgasm-rt"
  }
}

# ROUTE TABLE ASSOCIATIONS

resource "aws_route_table_association" "burgasm-rta-1" {
  count          = "${length(var.subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.burgasm-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.burgasm-rt.id}"
}



