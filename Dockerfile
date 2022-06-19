# docker build . -t trello-cal-sync-image

FROM alpine:3.16.0

RUN apk --no-cache add python3 py3-pip py3-virtualenv vim

RUN mkdir /app

WORKDIR /app

RUN pip install --upgrade setuptools && \
    pip install --upgrade wheel && \
    pip install --upgrade pip

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN pip cache purge

COPY . .

CMD ["python3", "trello_cal_sync.py"]
