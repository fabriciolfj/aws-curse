PRINCIPAL_ARN=$(aws sts get-caller-identity --query Arn --output text)

sed -e "s|PRINCIPAL_ARN|${PRINCIPAL_ARN}|g" assume-role-policy-template.json > assume-role-policy.json

ROLE_ARN=$(aws iam create-role --role-name AWSCookbook105Role --assume-role-policy-document file://assume-role-policy.json \
--output text --query Role.Arn)