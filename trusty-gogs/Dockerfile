FROM helmijoe07/trusty-golang-32bit
MAINTAINER helmijoe07

RUN echo "deb http://ftp.debian.org/debian/ wheezy-backports main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --force-yes -t wheezy-backports openssh-server

# grab but do not build gogs
RUN git config --global http.sslVerify false && git clone https://github.com/gogits/gogs.git /gopath/src/github.com/gogits/gogs

# set the working directory and add current stuff
WORKDIR /gopath/src/github.com/gogits/gogs
RUN git checkout master

RUN apt-get install -y ca-certificates
ENV GOPATH=/gopath
RUN go get -v -tags "sqlite redis memecache"
RUN go build -tags "sqlite redis memecache"

RUN useradd --shell /bin/bash --system --comment gogits git

RUN rm -fr /var/run/sshd && mkdir /var/run/sshd
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed 's@UsePrivilegeSeparation yes@UsePrivilegeSeparation no@' -i /etc/ssh/sshd_config
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config

# create new server keys on startup
RUN sed 's@^HostKey@\#HostKey@' -i /etc/ssh/sshd_config
RUN echo "HostKey /data/ssh/ssh_host_key" >> /etc/ssh/sshd_config
RUN echo "HostKey /data/ssh/ssh_host_rsa_key" >> /etc/ssh/sshd_config
RUN echo "HostKey /data/ssh/ssh_host_dsa_key" >> /etc/ssh/sshd_config
RUN echo "HostKey /data/ssh/ssh_host_ecdsa_key" >> /etc/ssh/sshd_config
RUN echo "HostKey /data/ssh/ssh_host_ed25519_key" >> /etc/ssh/sshd_config

# prepare data
ENV GOGS_CUSTOM /data/gogs
RUN echo "export GOGS_CUSTOM=/data/gogs" >> /etc/profile

RUN apt-get install -y rsync && apt-get clean
ADD . /gopath/src/github.com/gogits/gogs

EXPOSE 22 3000
ENTRYPOINT []

ADD start.sh ./start.sh
RUN chmod a+x ./start.sh

CMD ["./start.sh"]
