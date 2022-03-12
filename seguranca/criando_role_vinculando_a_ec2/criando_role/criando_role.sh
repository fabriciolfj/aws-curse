ROLE_ARN=$(aws iam create-role --role-name AWSCookbook106SSMRole \
  --assume-role-policy-document file://assume-role-policy.json \
  --output text --query Role.Arn)