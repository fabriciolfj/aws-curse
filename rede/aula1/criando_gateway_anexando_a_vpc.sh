VPC_ID=vpc-0cf45ca465b0ac60d
ROUTE_TABLE_ID=rtb-09d65d6566e3ed18b

INET_GATEWAY_ID=$(aws ec2 create-internet-gateway \
 --tag-specifications \
 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=AWSCookbook202}]' \
 --output text --query InternetGateway.InternetGatewayId)

##anexando a vpc
aws ec2 attach-internet-gateway \
 --internet-gateway-id $INET_GATEWAY_ID --vpc-id $VPC_ID

## para cada tabela de rota do vpc, cria uma rota de destino padrão
aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $INET_GATEWAY_ID

## criando um elastic ip e associando o mesmo
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc --output text --query AllocationId)

aws ec2 associate-address --instance-id i-09963b6075fcc08db --allocation-id $ALLOCATION_ID