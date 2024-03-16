# VPC 
resource "aws_vpc" "split_vpc"{
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    tags = {
        "Name" = "split_vpc"
    }
}

# Subnets
resource "aws_subnet" "split_public_subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.split_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    "Name" = var.subnet_names[count.index]
  }
}

#Internet Gateway 
resource "aws_internet_gateway" "split_igw" {
  vpc_id = aws_vpc.split_vpc.id

  tags = {
    Name = "split_igw"
  }
}

#Route Table 
resource "aws_route_table" "split_rt" {
  vpc_id = aws_vpc.split_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #public 
    gateway_id = aws_internet_gateway.split_igw.id
  }
  tags = {
    "Name" : "split_rt"
  }
}

#Route Table Association
resource "aws_route_table_association" "split_rta" {
  count = length((var.subnet_cidr))
  subnet_id      = aws_subnet.split_public_subnets[count.index].id
  route_table_id = aws_route_table.split_rt.id
}