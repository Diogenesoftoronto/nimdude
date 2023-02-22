
# This is a generated Dockerfile
FROM ubuntu:latest

WORKDIR /app

COPY ./build .

COPY .env .

COPY ./public ./public

EXPOSE 8080

# Set the command to start the app
CMD ["./build"]