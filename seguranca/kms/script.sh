#criando kms
KMS_KEY_ID=$(aws kms create-key --description "AWSCookbook107key" --output text --query KeyMetadata.KeyId)

#criando um apelido
aws kms create-alias --alias-name alias/AWSCookbook107Key --target-key-id $KMS_KEY_ID

#habilitando a rotação da chave a cada ano
aws kms enable-key-rotation --key-id $KMS_KEY_ID

#habilitar a encriptação default do ec2
aws ec2 enable-ebs-encryption-by-default

#atualizar o servico ec2, para utilizar a chave kms criada acima
aws ec2 modify-ebs-default-kms-key-id --kms-key-id alias/AWSCookbook107Key