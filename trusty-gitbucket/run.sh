#!/bin/bash
set -e

if [ -z "$GITBUCKET_PORT" ]; then
	GITBUCKET_PORT=80
fi

if [ -z "$GITBUCKET_HOST" ]; then
	GITBUCKET_HOST=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
fi

java -jar gitbucket.war --port=$GITBUCKET_PORT --host=$GITBUCKET_HOST
