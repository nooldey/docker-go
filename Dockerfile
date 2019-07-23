FROM alpine:latest AS build
LABEL Author "nooldey@gmail.com"
ENV GOLANG_VERSION 1.12.4
# Install Golang
RUN echo "installing go version $GOLANG_VERSION..."; \
        apk add --no-cache ca-certificates; \
        [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf; \
        set -eux; \
        apk add --no-cache --virtual .build-deps bash gcc musl-dev openssl go; \
        export \
                GOROOT_BOOTSTRAP="$(go env GOROOT)" \
                GOOS="$(go env GOOS)" \
                GOARCH="$(go env GOARCH)" \
                GOHOSTOS="$(go env GOHOSTOS)" \
                GOHOSTARCH="$(go env GOHOSTARCH)" \
        ; \
        wget -O go.tgz "https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz"; \
        tar -C /usr/local -xzf go.tgz && rm go.tgz; \
        cd /usr/local/go/src/ && ./make.bash; \
        rm -rf \
                /usr/local/go/pkg/bootstrap \
                /usr/local/go/pkg/obj \
        ; \
        apk del .build-deps; \
        export PATH="/usr/local/go/bin:$PATH";

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

FROM alpine:latest
COPY --from=build /go /go
CMD ["go","version"]
# Expose ports
EXPOSE 22
EXPOSE 80
