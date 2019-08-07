FROM amazonlinux

RUN set -exu && \
  yum update -y && \
  yum install -y tar gzip findutils && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash && \
  . ~/.nvm/nvm.sh && \
  nvm install 10 && \
  curl -OLv https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz && \
  tar -xzv -C /usr/local -f go1.10.1.linux-amd64.tar.gz && \
  rm go1.10.1.linux-amd64.tar.gz && \
  curl -OLv https://raw.githubusercontent.com/apex/apex/master/install.sh && \
  chmod +x ./install.sh && \
  ./install.sh && \
  rm install.sh && \ 
  mkdir /go

ENV PATH=$PATH:/usr/local/go/bin GOPATH=/go
