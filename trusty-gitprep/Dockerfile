FROM helmijoe07/trusty-build-essential-32bit
MAINTAINER helmijoe07

WORKDIR /root

RUN git clone https://github.com/yuki-kimoto/gitprep.git

WORKDIR /root/gitprep

EXPOSE 10020

RUN ./setup_module

RUN prove t

RUN ./setup_database

COPY run.sh /root/gitprep/run.sh
RUN chmod 755 /root/gitprep/run.sh

RUN git pull origin master

CMD ["./run.sh"]




