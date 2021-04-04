#!/usr/bin/env bash
set -e

curl https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz > go1.8.1.linux-amd64.tar.gz

echo "a579ab19d5237e263254f1eac5352efcf1d70b9dacadb6d6bb12b0911ede8994  go1.8.1.linux-amd64.tar.gz" | sha256sum -c

tar xzf go1.8.1.linux-amd64.tar.gz

export GOROOT=/libpostal/go
export GOBIN=/libpostal/go/bin
export GOPATH=/libpostal/workspace
export PATH=$PATH:/libpostal/go/bin

go get github.com/gorilla/mux
go get github.com/rs/cors
go get github.com/openvenues/gopostal/expand
go get github.com/openvenues/gopostal/parser
go build -i -o libpostal-rest
mv libpostal-rest $GOBIN/libpostal-rest
