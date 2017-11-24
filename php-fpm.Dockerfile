FROM php:7.1-fpm-alpine

# Composerのインストール
RUN cd /usr/local/bin && curl -sS https://getcomposer.org/installer | php && mv composer.phar composer

# エクステンションのインストール
RUN docker-php-ext-install pdo pdo_mysql

# コンテナ起動時に入れられないファイルがある場合は、イメージを作成する段階でファイルをコピーする。（例: 権限が必要な外部プライベートモジュール）
# コンテナ起動にファイルを入れられれば、docker-compose.ymlやDockerrun.aws.jsonのvolumesだけで十分。
ADD ./laravel /var/www/html
RUN chmod 777 -R /var/www/html/storage