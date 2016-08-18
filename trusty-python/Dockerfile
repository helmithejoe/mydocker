FROM helmijoe07/ubuntu-trusty-32bit

MAINTAINER helmijoe07

# Install required packages and remove the apt packages cache when done.

RUN apt-get install -y software-properties-common && add-apt-repository universe && apt-get update && apt-get install -y \
	git \
	python \
	python-dev \
	python-setuptools \
	sqlite3 \
  && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN apt-get remove -y software-properties-common
RUN easy_install pip


