FROM alpine

WORKDIR monitor

ENV TZ "America/Sao_Paulo"
RUN apk add --update py-pip python-dev build-base gcc libffi-dev openssl-dev tzdata

COPY . .
RUN ls

RUN pip install -r requirements.txt \
    && echo $TZ > /etc/timezone


RUN echo '*  *  *  *  *  cd /monitor && python /monitor/run.py' > /etc/crontabs/root

CMD ["crond", "-f"]