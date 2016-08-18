FROM helmijoe07/trusty-python-32bit

MAINTAINER helmijoe07

# Install required packages and remove the apt packages cache when done.

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository universe && apt-get update && apt-get install -y \
	nginx \
	supervisor \
  && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN apt-get remove -y software-properties-common

# install uwsgi now because it takes a little while
RUN pip install uwsgi

# setup all the configfiles
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default
COPY supervisor-app.conf /etc/supervisor/conf.d/

# COPY requirements.txt and RUN pip install BEFORE adding the rest of your code, this will cause Docker's caching mechanism
# to prevent re-installinig (all your) dependencies when you made a change a line or two in your app. 

COPY app/requirements.txt /home/docker/code/app/
RUN pip install -r /home/docker/code/app/requirements.txt

# add (the rest of) our code
COPY . /home/docker/code/

# install django, normally you would remove this step because your project would already
# be installed in the code/app/ directory
RUN django-admin.py startproject website /home/docker/code/app/ 


EXPOSE 80
CMD ["supervisord", "-n"]
