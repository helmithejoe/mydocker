FROM helmijoe07/ubuntu-trusty-32bit
MAINTAINER helmijoe07

# Install php5 + nginx + DB clients
RUN apt-get install -y -qq software-properties-common && add-apt-repository universe && apt-get update && \
      apt-get install -y nginx \
      unzip \
      git \
      libxml2 \
      libcurl4-openssl-dev \
      php5-dev \
      php5-cli \
      php5-sqlite \
      php5-mysql \
      php5-pgsql \
      php5-redis \
      php5-mongo \
      php5-mcrypt \
      php5-curl \
      php5-json \
      php5-gd \
      php5-xsl \
      php5-fpm \
      php-pear \
      php-apc \
      sqlite3 libsqlite3-dev \
      php5-intl \
  && apt-get remove -y software-properties-common && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# nginx config
ADD nginx-default.conf /etc/nginx/sites-available/default
RUN  echo "daemon off;" >> /etc/nginx/nginx.conf \
  && echo "fix ownership of sock file for php-fpm as our version of nginx runs as root" \
  && sed -i -e "s/user www-data/user root/g" /etc/nginx/nginx.conf \
  && sed -i -e "s/www-data/root/g" /etc/php5/fpm/pool.d/www.conf \
  && sed -i -e "s/;clear_env = no/clear_env = no/g" /etc/php5/fpm/pool.d/www.conf \
  && sed -i -e "s/DAEMON_ARGS=\"/DAEMON_ARGS=\"--allow-to-run-as-root /g" /etc/init.d/php5-fpm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80
CMD ["/run.sh"]
