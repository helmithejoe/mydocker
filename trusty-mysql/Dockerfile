FROM helmijoe07/ubuntu-trusty-32bit
MAINTAINER helmijoe07

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

# Add image configuration and scripts
RUN apt-get install -y mysql-server

RUN apt-get clean

RUN rm -fr /var/lib/apt/lists/*

ADD my.cnf /etc/mysql/conf.d/my.cnf 
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/mysql"]
CMD ["/usr/local/bin/run"]
