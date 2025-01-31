# Crear una VPC
resource "aws_vpc" "mi_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "mi-vpc"
  }
}

# Crear una subred pública
resource "aws_subnet" "subred_publica" {
  vpc_id            = aws_vpc.mi_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subred-publica"
  }
}

# Crear un Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mi_vpc.id

  tags = {
    Name = "mi-igw"
  }
}

# Crear una tabla de rutas pública
resource "aws_route_table" "ruta_publica" {
  vpc_id = aws_vpc.mi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "ruta-publica"
  }
}

# Asociar la subred pública con la tabla de rutas pública
resource "aws_route_table_association" "asociacion_subred_publica" {
  subnet_id      = aws_subnet.subred_publica.id
  route_table_id = aws_route_table.ruta_publica.id
}
