FROM ubuntu:20.10

ADD . /opt/
WORKDIR /opt/
RUN ["sh","./setup.sh"]

ENTRYPOINT ["sh","-c","vim"]
