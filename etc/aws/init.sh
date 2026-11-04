#!/bin/bash

AWS_ACCESS_KEY_ID=LS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=LS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION=LS_REGION


openssl genpkey -algorithm RSA -out /tmp/algashop-private-key.pem -pkeyopt rsa_keygen_bits:2048

PRIVATE_KEY_B64=$(base64 -w 0 /tmp/algashop-private-key.pem)

PRIVATE_KEY_ID=$(openssl rand -hex 16)

printf '{"privateKeyId":"%s","privateKey":"%s"}' \
  "$PRIVATE_KEY_ID" "$PRIVATE_KEY_B64" > /tmp/secret.json

awslocal secretsmanager create-secret \
  --name /config/algashop/authorization-server/rsa-key \
  --secret-string file:///tmp/secret.json

awslocal configure set cli_follow_urlparam false

# CSV


# Parâmetros do SSM
{
  read -r _header                       # descarta o cabeçalho
  while IFS=',' read -r name type value || [ -n "$name" ]; do  # robusto a arquivo sem \n final
    [ -z "$name" ] && continue          # pula linha em branco
    case "$name" in \#*) continue ;; esac   # pula comentário
    value=${value%$'\r'}                # remove \r se foi salvo no Windows
    awslocal ssm put-parameter --name "$name" --type "$type" --value "$value" --overwrite
  done
} < /etc/aws/parameters.csv



# Segredos do Secrets Manager
{
  read -r _header
  while IFS=',' read -r name value || [ -n "$name" ]; do
    [ -z "$name" ] && continue
    case "$name" in \#*) continue ;; esac
    value=${value%$'\r'}
    awslocal secretsmanager create-secret --name "$name" --secret-string "$value"
  done
} < /etc/aws/secrets.csv



# Buckets e arquivos do S3

awslocal s3 mb s3://algashop-product-image

awslocal s3api put-bucket-cors --bucket algashop-product-image --cors-configuration file:///etc/aws/cors.json

BUCKET=algashop-product-image

# S3
{
  read -r _header                                # descarta o cabeçalho
  while IFS=',' read -r key ct || [ -n "$key" ]; do  # robusto a arquivo sem \n final
    [ -z "$key" ] && continue                    # pula linha em branco
    case "$key" in \#*) continue ;; esac         # pula comentário
    ct=${ct%$'\r'}                               # remove \r se salvo no Windows
    awslocal s3api put-object \
      --bucket "$BUCKET" --key "$key" --content-type "$ct" --body "/etc/images/$key"
  done
} < /etc/aws/s3.csv