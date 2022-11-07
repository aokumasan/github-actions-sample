FROM golang:1.19-alpine as builder

WORKDIR /work

COPY . .

RUN apk add --no-cache make && \
    make build


FROM alpine:latest

COPY --from=builder /work/sample /bin/sample

ENTRYPOINT ["/bin/sample"]
