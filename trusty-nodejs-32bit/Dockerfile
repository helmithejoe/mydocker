FROM helmijoe07/ubuntu-trusty-32bit
MAINTAINER helmijoe07

RUN apt-get update && apt-get install -y curl build-essential libssl-dev git

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 0.10.33

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

RUN apt-get remove -y build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app

WORKDIR /app

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
