FROM debian:buster

LABEL maintainer cjettie <cjettie@student.21-school.ru>
RUN apk update && \
	apk	upgrade && \
	apk add openssl

