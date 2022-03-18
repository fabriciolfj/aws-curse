#s3 intelligent-tiering indicado -> macanismo para enviar arquivos menos acessados a um s3 glacier, podemos definir o tempo necessário para tal transação
aws s3api put-bucket-intelligent-tiering-configuration \
 --bucket test-flfj124 \
 --id awscookbook302 \
 --intelligent-tiering-configuration "$(cat tiering.json)"