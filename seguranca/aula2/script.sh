#definindo uma politica de senha
aws iam update-account-password-policy \
 --minimum-password-length 12 \
 --required-symbols \
 --required-numbers \
 --required-uppercase-characters \
 --required-lowercase-characters \
 --allow-users-to-change-password \
 --max-password-age 90 \
 --password-reuse-prevention true

#criando um grupo de usuarios
aws iam create-group --group-name AWSCookbook103Group

#vinculando a politica AWSBillingReadOnlyAccess ao grupo
aws iam attach-group-policy --group-name AWSCookbook103Group --policy-arn arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess

#criando usuario
aws iam create-user --user-name awscookbook103user

#gerando uma senha que atenda as regras da politica
RANDOM_STRING=$(aws secretsmanager get-random-password --password-length 12 --require-each-included-type --output text --query RandomPassword)
echo $RANDOM_STRING

#fazer login com o password para o usuario acima
aws iam create-login-profile --user-name awscookbook103user --password $RANDOM_STRING

#adicionado o usuario ao grupo
aws iam add-user-to-group --group-name AWSCookbook103Group --user-name awscookbook103user

#validando
aws iam get-account-password-policy