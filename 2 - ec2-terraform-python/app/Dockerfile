FROM python:3.12.5-bullseye AS builder

WORKDIR /app

RUN apt update -y \
    && apt install git curl make \
    && groupadd -g 1000 python \
    && useradd -u 1000 -g 1000 python 

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY ./ ./

CMD "make start"

FROM builder as develop
