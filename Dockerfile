# docker build . -t trello-cal-sync-image

FROM ubuntu:20.04

RUN apt update && apt-get -y install git make python3 python3-pip python3-venv vim virtualenvwrapper

RUN mkdir /app

WORKDIR /app

VOLUME /app

ENTRYPOINT /app/trello-cal-sync/run_trello_cal_sync.sh

