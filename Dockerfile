FROM golang:1.19.4-alpine

ENV GOOS=linux
RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./
COPY cmd ./cmd

# RUN go build -o /docker-hdhomerun_exporter
# RUN chmod a+x /docker-hdhomerun_exporter

CMD [ "go","run", "cmd/hdhomerun_exporter/main.go" ]

