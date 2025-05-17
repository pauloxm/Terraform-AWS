resource "aws_vpc" "minha-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "minha-subnet" {
  vpc_id     = aws_vpc.minha-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "subnet-terraform"
  }
}

resource "aws_internet_gateway" "minha-internet_gateway" {
  vpc_id = aws_vpc.minha-vpc.id

  tags = {
    Name = "internet-gateway-terraform"
  }
}

resource "aws_route_table" "minha-route_table" {
  vpc_id = aws_vpc.minha-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.minha-internet_gateway.id
  }

  tags = {
    Name = "route-table-terraform"
  }
}

resource "aws_route_table_association" "minha-route_table_association" {
  subnet_id      = aws_subnet.minha-subnet.id
  route_table_id = aws_route_table.minha-route_table.id
}

resource "aws_security_group" "minha-security_group" {
  name        = "security-group-devops"
  description = "Declara regras de acesso"
  vpc_id      = aws_vpc.minha-vpc.id

  tags = {
    Name = "security-group-terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "minha-ingress_rule_ipv4_ssh" {
  security_group_id = aws_security_group.minha-security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "minha-egress_rule_ipv4" {
  security_group_id = aws_security_group.minha-security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}