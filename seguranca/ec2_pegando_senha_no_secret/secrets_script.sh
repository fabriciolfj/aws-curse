#gerando senha
RANDOM_STRING=$(aws secretsmanager get-random-password --password-length 32 --require-each-included-type --output text --query RandomPassword)

#armazenando senha
SECRET_ARN=$(aws secretsmanager create-secret --name AWSCookbook108/Secret1 --description "AWSCookbook108 secret 1" \
 --secret-string $RANDOM_STRING --output text --query ARN)