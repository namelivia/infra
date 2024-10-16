FROM python:3.13.0-alpine
RUN apk add --no-cache git openssh-client tar
RUN pip install ansible
WORKDIR /app
COPY ./ssh_key /app/env/ssh_key
