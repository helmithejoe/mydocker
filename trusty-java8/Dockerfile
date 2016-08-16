FROM helmijoe07/ubuntu-trusty-32bit
MAINTAINER helmijoe07

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
	&& apt-get install -y -qq software-properties-common && add-apt-repository -y ppa:webupd8team/java && apt-get update

RUN apt-get install -y oracle-java8-installer git \
	&& rm -fr /var/lib/apt/lists/* \
	&& apt-get remove -y software-properties-common \
	&& apt-get clean \
	&& rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
