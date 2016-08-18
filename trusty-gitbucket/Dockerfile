FROM helmijoe07/trusty-java8-32bit
MAINTAINER helmijoe07

WORKDIR /root

RUN -k curl https://github.com/gitbucket/gitbucket/releases/download/4.3/gitbucket.war

ADD run.sh /root/run.sh
RUN chmod 755 /root/run.sh

EXPOSE 80

RUN apt-get update && apt-get install -y git \
	&& rm -fr /var/lib/lists/* \
	&& apt-get-clean

CMD ["./run.sh"]
