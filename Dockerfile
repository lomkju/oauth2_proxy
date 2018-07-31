FROM golang:rc-alpine3.7
RUN apk add git
RUN apk add curl
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
ENV SRC_DIR=/go/src/github.com/lomkju/oauth2_proxy
COPY . $SRC_DIR
WORKDIR $SRC_DIR
RUN dep ensure
RUN go build -o /oauth2_proxy
ENTRYPOINT [ "/oauth2_proxy" ]