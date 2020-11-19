FROM nginx:alpine

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

COPY nginx.conf /etc/nginx/

# If you're in China, or you need to change sources, will be set CHANGE_SOURCE to true in .env.

ARG CHANGE_SOURCE=true
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # Change application source from dl-cdn.alpinelinux.org to aliyun source
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

RUN apk update \
    && apk upgrade \
    && apk --update add logrotate \
    && apk add --no-cache openssl \
    && apk add --no-cache bash

RUN apk add --no-cache curl

# Set upstream conf and remove the default conf
RUN echo "upstream php56-upstream { server php56-fpm:9000; }" > /etc/nginx/conf.d/php56-upstream.conf \
    && echo "upstream php73-upstream { server php73-fpm:9000; }" > /etc/nginx/conf.d/php73-upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

EXPOSE 80 81 443
