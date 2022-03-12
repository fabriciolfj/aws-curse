data "aws_subnet" "subnet" {
  id = "subnet-0eac5f18502085b45"
}

resource "aws_instance" "test" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.subnet.id

  tags = var.instance_tags
}