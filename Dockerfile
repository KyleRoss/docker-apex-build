FROM amazonlinux

RUN set -exu && \
  curl -OLv https://nodejs.org/dist/v10.16.1/node-v10.16.1-linux-x64.tar.gz && \
  tar -xzv -C /usr/local --strip-components 1 -f node-v10.16.1-linux-x64.tar.gz && \
  rm node-v10.16.1-linux-x64.tar.gz && \
  curl -OLv https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz && \
  tar -xzv -C /usr/local -f go1.10.1.linux-amd64.tar.gz && \
  rm go1.10.1.linux-amd64.tar.gz && \
  curl -OLv https://raw.githubusercontent.com/apex/apex/master/install.sh && \
  chmod +x ./install.sh && \
  ./install.sh && \
  rm install.sh && \ 
  mkdir /go && \
  yum update -y && \
  yum install -y findutils

ENV PATH=$PATH:/usr/local/go/bin GOPATH=/go
