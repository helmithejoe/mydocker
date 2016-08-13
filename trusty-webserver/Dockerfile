FROM helmijoe07/ubuntu-trusty-32bit
MAINTAINER helmijoe07

# Install base packages
RUN apt-get install -y software-properties-common && add-apt-repository universe && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
	php5 \
	php-pear \
	php5-dev \
        php5-mysql \
	php5-pgsql \
	php5-redis \
	php5-mongo \
	git \
        php5-mcrypt \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN /usr/sbin/php5enmod mcrypt
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

ENV ALLOW_OVERRIDE **False**

RUN apt-get remove -y software-properties-common && apt-get clean

# Add image configuration and scripts
ADD go.sh /go.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app
RUN mkdir -p /app/public/ && rm -fr /var/www/html && ln -s /app/public /var/www/html

RUN echo '<?php echo phpinfo();' > /app/public/i.php


# Clone base framework


EXPOSE 80
WORKDIR /app
CMD ["/go.sh"]
