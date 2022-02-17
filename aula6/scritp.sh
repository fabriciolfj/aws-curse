sed -e "s|AWS_ACCOUNT_ID|${AWS_ACCOUNT_ID}|g" \
 policy-template.json > policy.json

aws iam create-policy --policy-name AWSCookbook105Policy \
 --policy-document file://policy.json