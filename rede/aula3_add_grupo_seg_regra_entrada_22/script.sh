VPC_ID="vpc-0cf45ca465b0ac60d"

#criando security group
SG_ID=$(aws ec2 create-security-group \
      --group-name AWSCookbook205Sg \
      --description "Instance Security Group" --vpc-id $VPC_ID \
      --output text --query GroupId)

#anexar o segurity group nas duas instancias
aws ec2 modify-instance-attribute --instance-id "i-03321ecf00e4aaf5e" --groups $SG_ID

aws ec2 modify-instance-attribute --instance-id "i-0acca1307401457ec" --groups $SG_ID

aws ec2 authorize-security-group-ingress \
 --protocol tcp --port 22 \
 --source-group $SG_ID \
 --group-id $SG_ID