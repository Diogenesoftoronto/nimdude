
# This is a generated Dockerfile
FROM ubuntu:latest
FROM golang:1.18

WORKDIR /app

COPY ./go.mod .

COPY ./go.sum .

COPY ./public ./public

COPY main.go .

ENV PORT=$PORT

RUN go build -o build

RUN go mod download
EXPOSE 8080

# Set the command to start the app
CMD ["./build"]