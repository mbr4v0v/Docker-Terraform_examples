# Crear una instancia EC2
resource "aws_instance" "instancia_ejemplo" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 en us-east-1
  instance_type          = "t2.micro"              # Tipo de instancia elegible para Free Tier
  key_name               = "vockey"                # Par de claves SSH existente
  subnet_id              = aws_subnet.subred_publica.id
  vpc_security_group_ids = [aws_security_group.sg_instancia.id]

  tags = {
    Name = "instancia-ejemplo"
  }
}
