aws iam create-role --role-name AWSCookbook105test2 \
 --assume-role-policy-document \
 file://lambda-assume-role-policy.json \
 --permissions-boundary \
 arn:aws:iam::$AWS_ACCOUNT_ID:policy/AWSCookBook105PB  --output text --query Role.Arn