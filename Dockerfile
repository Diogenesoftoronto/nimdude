
# This is a generated Dockerfile
FROM ubuntu:latest

WORKDIR /app

COPY . .

EXPOSE 8080

# Set the command to start the app
CMD ["./build"]