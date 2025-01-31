# Crear un grupo de seguridad
resource "aws_security_group" "sg_instancia" {
  name_prefix = "instancia-" # Cambiado: No incluir "sg-" en el prefijo
  vpc_id      = aws_vpc.mi_vpc.id

  # Regla de entrada para SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite SSH desde cualquier IP (no recomendado en producción)
  }

  # Regla de salida para todo el tráfico
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-instancia"
  }
}
