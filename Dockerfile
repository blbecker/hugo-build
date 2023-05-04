FROM alpine:latest

ENV HUGO_VERSION="v0.111.3"

LABEL "com.github.actions.name"="Hugo Build"
LABEL org.opencontainers.image.authors=="github@mail.bckr.me"

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /opt/go
ENV PATH /opt/go/bin:$PATH

RUN apk add --no-cache git go g++

RUN go install -v -tags extended github.com/gohugoio/hugo@${HUGO_VERSION} && \
    go clean --cache --modcache --fuzzcache && \
    hugo version

COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
