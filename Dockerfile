# FROM alpine:3.7
FROM alpine:3.11

#Install dependencies
RUN apk --no-cache upgrade
RUN apk add --no-cache \
    apache2 apache2-ssl php7 php7-tokenizer php7-ctype php7-session php7-apache2 \
    php7-json php7-pdo php7-pdo_mysql php7-curl php7-ldap php7-openssl php7-iconv \
    php7-xml php7-xsl php7-gd php7-zip php7-soap php7-mbstring php7-zlib \
    php7-mysqli php7-sockets php7-xmlreader mysql-client tar curl imagemagick-dev

#    perl python openssl git libffi-dev py-pip python-dev build-base openssl-dev dcron


WORKDIR /var/www/localhost/htdocs/

COPY code/ /var/www/localhost/htdocs/

RUN echo "Removing .git directory ..." \
    && rm -rf .git \
    && mkdir -p /run/apache2 \
    && echo "Changing directory permissions to apache:apache ..." \
    && chown -R apache:apache /var/www/localhost/htdocs

# Following two lines are not needed, because the files are already owned by apache.
#    && chmod 666 sites/default/sqlconf.php \
#    && chmod 666 interface/modules/zend_modules/config/application.config.php \

# Following are required for LetsEncrypt / SSL, etc. Not needed at the moment.

#    && git clone https://github.com/letsencrypt/letsencrypt /opt/certbot \
#    && pip install --upgrade pip \
#    && pip install -e /opt/certbot/acme -e /opt/certbot \
#    && mkdir -p /etc/ssl/certs /etc/ssl/private \
#    && apk del --no-cache git build-base libffi-dev python-dev

VOLUME [ "/var/www/localhost/htdocs/sites", "/etc/letsencrypt/", "/etc/ssl" ]

# configure apache & php properly

# ENV APACHE_LOG_DIR=/var/log/apache2

COPY configs/php.ini /etc/php7/php.ini
COPY configs/openemr-apache.conf /etc/apache2/conf.d/
COPY scripts/docker-entrypoint.sh  /docker-entrypoint.sh

# add runner and auto_configure and prevent auto_configure from being run w/o being enabled

# COPY run_openemr.sh autoconfig.sh auto_configure.php /var/www/localhost/htdocs/openemr/
# COPY utilities/unlock_admin.php utilities/unlock_admin.sh /root/

# RUN chmod 500 run_openemr.sh autoconfig.sh /root/unlock_admin.sh \
#     && chmod 000 auto_configure.php /root/unlock_admin.php
# fix issue with apache2 dying prematurely


# CMD [ "./run_openemr.sh" ]


ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 443
