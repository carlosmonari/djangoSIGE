FROM python:3.8
MAINTAINER carlosmonari@gmail.com
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /opt/djangoSIGE/

WORKDIR /opt/djangoSIGE/
RUN mkdir /webapps
COPY requirements.txt /opt/djangoSIGE/
WORKDIR /webapps
RUN apk add --no-cache python3 python3-dev \

    py3-cffi zlib-dev gcc jpeg-dev \
# Installing OS Dependencies
    linux-headers libressl-dev \
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    libxml2-dev libxslt-dev \
libsqlite3-dev
    musl-dev postgresql-dev \

    && pip3 install -r requirements.txt \
RUN pip3 install -U pip setuptools
    && pip3 install gunicorn psycopg2
