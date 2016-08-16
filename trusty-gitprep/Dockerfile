FROM helmijoe07/ubuntu-trusty-32bit
MAINTAINER helmijoe07

RUN apt-get update && apt-get install -y curl git build-essential

RUN mkdir /root/gitprep

WORKDIR /root/gitprep 

EXPOSE 10020

RUN curl -kL https://github.com/yuki-kimoto/gitprep/archive/latest.tar.gz > gitprep-latest.tar.gz \
	&& tar xf gitprep-latest.tar.gz \
	&& mv gitprep-latest/* . \
	&& rm -fr gitprep-latest gitprep-latest.tar.gz \
	&& rm -fr /var/lib/apt/lists/* && apt-get clean


RUN ./setup_module

RUN prove t

RUN ./setup_database

CMD ["./gitprep"]




