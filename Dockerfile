# docker build . -t trello-cal-sync-image

FROM alpine:3.16.0

RUN apk update && apk upgrade && apk add git make python3 py3-pip py3-virtualenv vim

RUN mkdir /app

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade setuptools && \
    pip install --upgrade wheel && \
    pip install --upgrade pip

COPY . .

CMD ["python3", "trello_cal_sync.py"]
