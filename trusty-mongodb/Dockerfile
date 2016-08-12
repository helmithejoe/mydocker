FROM helmijoe07/ubuntu-trusty-32bit
MAINTAINER helmijoe07

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list && \
	apt-get update

RUN dpkg-divert --local --rename --add /sbin/initctl && \
	ln -s /bin/true /sbin/initctl

RUN apt-get install mongodb-10gen

RUN rm -rf /var/lib/apt/lists/* && apt-get clean

RUN mkdir -p /data/db

EXPOSE 27017/tcp

VOLUME ["/data/db"]

CMD ["mongod"]
