PRINCIPAL_ARN=$(aws sts get-caller-identity --query Arn --output text)

sed -E "s|PRINCIPAL_ARN|${PRINCIPAL_ARN}|g" assume-role-policy-template.json > assume-role-policy.json

ROLE_ARN=$(aws iam create-role --role-name AWSCookbook101Role --assume-role-policy-document file://assume-role-policy.json --output text --query Role.Arn)

aws iam attach-role-policy --role-name AWSCookbook101Role --policy-arn arn:aws:iam::aws:policy/PowerUserAccess