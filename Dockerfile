FROM ubuntu:16.04

ARG COMMIT
ENV COMMIT ${COMMIT:-master}
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    autoconf automake build-essential curl git libsnappy-dev libtool pkg-config

RUN git clone https://github.com/openvenues/libpostal -b $COMMIT

WORKDIR /libpostal

COPY ./build_libpostal.sh /libpostal/
RUN ./build_libpostal.sh

COPY ./build_libpostal_rest.sh /libpostal/
COPY src/main.go /libpostal/
RUN ./build_libpostal_rest.sh

EXPOSE 8080

CMD /libpostal/go/bin/libpostal-rest
