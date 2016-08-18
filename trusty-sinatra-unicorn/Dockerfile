FROM helmijoe07/trusty-ruby-32bit

MAINTAINER helmijoe07

RUN gem install bundler
RUN locale-gen en_US en_US.UTF-8
EXPOSE 8080

RUN git clone https://github.com/helmithejoe/awesome-deploy.git /opt/awesome-deploy/

WORKDIR /opt/awesome-deploy/sinatra-unicorn-docker

RUN bundle install

CMD ["unicorn","-d","-c", "unicorn.conf"]
