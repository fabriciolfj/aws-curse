#criando uma role
aws iam create-role --assume-role-policy-document file://assume-role-policy.json --role-name AWSCookbook104IamRole

#vinculando a policy a role
aws iam attach-role-policy --role-name AWSCookbook104IamRole --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess

#simulando se a role esta atendendo as permissões (devera negar uma vez que anexou uma permissão de leitura e nao criacao)
aws iam simulate-principal-policy --policy-source-arn arn:aws:iam::xx:role/AWSCookbook104IamRole --action-names ec2:CreateInternetGateway

# Segunda simulacao, deve dar ok
aws iam simulate-principal-policy --policy-source-arn arn:aws:iam::xx:role/AWSCookbook104IamRole --action-names ec2:DescribeInstances