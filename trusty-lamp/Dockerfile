FROM helmijoe07/trusty-webserver-32bit

MAINTAINER helmijoe07


RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y mysql-server mysql-client

RUN rm -rf /var/lib/apt/lists/* && apt-get clean

# mysql config
ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 664 /etc/mysql/conf.d/my.cnf

EXPOSE 3306

ADD go.sh /go.sh
RUN chmod 755 /*.sh

CMD ["/go.sh"]
