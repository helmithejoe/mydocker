FROM helmijoe07/trusty-java8-32bit
MAINTAINER helmijoe07

WORKDIR /root

RUN apt-get update && apt-get install -y curl git \
	&& curl -kL https://github.com/gitbucket/gitbucket/releases/download/4.3/gitbucket.war > gitbucket.war \
	&& rm -fr /var/lib/apt/lists/* \
	&& apt-get clean

ADD run.sh /root/run.sh
RUN chmod 755 /root/run.sh

EXPOSE 80

CMD ["./run.sh"]
