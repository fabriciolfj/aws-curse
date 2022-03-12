#ver as zonas de disponibilidade da regiao us-east-2
#aws ec2 describe-availability-zones --region us-east-2

VPC_ID=vpc-0cf45ca465b0ac60d

ROUTE_TABLE_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID \
 --tag-specifications \
 'ResourceType=route-table,Tags=[{Key=Name,Value=AWSCookbook202}]' \
  --output text --query RouteTable.RouteTableId)

SUBNET_ID_1=$(aws ec2 create-subnet --vpc-id $VPC_ID \
  --cidr-block 10.10.0.0/24 --availability-zone us-east-2a \
  --tag-specifications \
  'ResourceType=subnet,Tags=[{Key=Name,Value=AWSCookbook202a}]' \
  --output text --query Subnet.SubnetId)

SUBNET_ID_2=$(aws ec2 create-subnet --vpc-id $VPC_ID \
  --cidr-block 10.10.1.0/24 --availability-zone us-east-2b \
  --tag-specifications \
  'ResourceType=subnet,Tags=[{Key=Name,Value=AWSCookbook202a}]' \
  --output text --query Subnet.SubnetId)

aws ec2 associate-route-table \
 --route-table-id $ROUTE_TABLE_ID --subnet-id $SUBNET_ID_1

 aws ec2 associate-route-table \
  --route-table-id $ROUTE_TABLE_ID --subnet-id $SUBNET_ID_2