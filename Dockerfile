
# This is a generated Dockerfile
FROM alpine:latest
WORKDIR /app
COPY ./build .

EXPOSE 8080

# Set the command to start the app
ENTRYPOINT ["./build"]