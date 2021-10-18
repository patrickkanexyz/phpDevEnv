FROM php:fpm

ARG APP_ENV=prod

RUN docker-php-ext-install pdo pdo_mysql && \
	pecl install xdebug && \
	docker-php-ext-enable xdebug

RUN if [ ${APP_ENV} = "dev" ]; then \
	php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer; \
	fi
