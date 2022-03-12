VPC_ID=$(aws ec2 create-vpc --cidr-block 10.10.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=name,Value=AWSCookbook201}]' \
--output text --query Vpc.VpcId)

aws ec2 describe-vpcs --vpc-ids $VPC_ID

##adicionando espaço ipv4 ao vpc
aws ec2 associate-vpc-cidr-block \
 --cidr-block 10.11.0.0/16 \
 --vpc-id vpc-0cf45ca465b0ac60d