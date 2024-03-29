FROM golang:1.11 as builder
WORKDIR $GOPATH/src/github.com/johan-lejdung/go-microservice-api-guide/rest-api
COPY ./ .
RUN GOOS=linux GOARCH=386 go build -ldflags="-w -s" -v
RUN cp rest-api /

FROM alpine:latest
COPY --from=builder /rest-api /
CMD ["/rest-api"]