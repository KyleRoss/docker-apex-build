FROM amazonlinux

ENV NODE_VERSION 10.16.3
ENV NVM_DIR $HOME/.nvm

RUN set -exu && \
  yum update -y && \
  yum groupinstall "Development Tools" -y && \
  yum install -y tar gzip findutils && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash && \
  source $NVM_DIR/nvm.sh && \
  nvm install $NODE_VERSION && \
  nvm alias default $NODE_VERSION && \
  nvm use default && \
  curl -OLv https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz && \
  tar -xzv -C /usr/local -f go1.10.1.linux-amd64.tar.gz && \
  rm go1.10.1.linux-amd64.tar.gz && \
  curl -OLv https://raw.githubusercontent.com/apex/apex/master/install.sh && \
  chmod +x ./install.sh && \
  ./install.sh && \
  rm install.sh && \ 
  mkdir /go

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go
