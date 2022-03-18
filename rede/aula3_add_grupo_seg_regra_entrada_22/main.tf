provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

data "aws_subnet" "subnet" {
  id = "subnet-0eac5f18502085b45"
}

resource "aws_instance" "test" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.subnet.id

  tags = var.instance_tags
}

resource "aws_instance" "test2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.subnet.id

  tags = var.instance_tags
}