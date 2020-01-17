FROM centos:7

ENV PATH $PATH:/usr/local/go/bin:/root/go/bin
ENV GOPATH /root/go
ADD . /opt/
WORKDIR /opt/
RUN ["sh","./setup.sh"]

ENTRYPOINT ["sh","-c","vim","+PlugInstall","+q","+GoInstallBinaries"]
