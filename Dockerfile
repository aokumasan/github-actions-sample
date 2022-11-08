FROM golang:1.19-alpine as builder

WORKDIR /work

COPY . .

RUN apk add --no-cache make && \
    make build


FROM alpine:3.10

COPY --from=builder /work/sample /bin/sample

RUN apk add --no-cache open-vm-tools

ENTRYPOINT ["/bin/sample"]
