data "aws_subnet" "subnet" {
  id = "subnet-0eac5f18502085b45"
}

data "aws_iam_policy" "codedeploy_service_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role" "test_role" {
  name = "test-ssm-ec2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
      "Statement": [
      {
      "Action": "sts:AssumeRole",
      "Principal": {
      "Service": "ec2.amazonaws.com"
     },
    "Effect": "Allow",
    "Sid": ""
   }
 ]
}
EOF
}
#Attach Policies to Instance Role
resource "aws_iam_role_policy_attachment" "codedeploy_service_role_policy_attach" {
  role       = aws_iam_role.test_role.name
  policy_arn = data.aws_iam_policy.codedeploy_service_policy.arn
}

resource "aws_iam_policy_attachment" "test_attach1" {
  name       = "test-attachment"
  roles      = [aws_iam_role.test_role.id]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy_attachment" "test_attach2" {
  name       = "test-attachment"
  roles      = [aws_iam_role.test_role.id]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

#EC2 Instance

resource "aws_iam_instance_profile" "test_profile" {
  name = "test-ssm-ec2"
  role = aws_iam_role.test_role.id
}

resource "aws_instance" "test-ec2" {
  ami = "ami-066157edddaec5e49"
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.subnet.id
  iam_instance_profile = aws_iam_instance_profile.test_profile.id
  tags = {
    Name = "test-ec2"
    createdBy = "fabricio"
    Owner = "DevSecOps"
    Project = "test-terraform"
    environment = "test"
  }
}