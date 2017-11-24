#!/bin/bash

set -xue
# login docker（プロフィールが必要な場合）
AWS_ECR_GET_LOGIN="aws ecr get-login --no-include-email --region ap-northeast-1 --profile ${AWSCLI_PROFILE}"
DOCKER_LOGIN=`eval ${AWS_ECR_GET_LOGIN}`
eval ${DOCKER_LOGIN}

# build image
docker build -t php-fpm:latest -f php-fpm.Dockerfile .

# store image
docker tag php-fpm:latest xxxxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/php-fpm:latest
docker push xxxxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com/php-fpm:latest