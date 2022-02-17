sed -e "s|AWS_ACCOUNT_ID|${AWS_ACCOUNT_ID}|g" \
  boundary-policy-template.json > boundary-policy.json

aws iam create-policy --policy-name AWSCookbook105PB \
 --policy-document file://boundary-policy.json