# Build stage
# stage to build the golang code to binary file

# docker base image name and version
# AS build is the name of the stage 
# (multi stage build so the docker image size is less)
FROM golang:1.16-alpine3.13 AS builder
# working directory in docker image
WORKDIR /app
# copy all necessary files to workdir (/app) folder
COPY . .
# compile to binary file named main
RUN go build -o main main.go
# install apk to current stage image (alpine image doesn't have curl)
RUN apk --no-cache add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.14.1/migrate.linux-amd64.tar.gz | tar xvz

# Run stage
# stage to run the binary file output after build stage

# base image should the same as build stage
# to make sure everything is compatible
FROM alpine:3.13
WORKDIR /app
# copy executable file from builder stage to current stage
# copy /app/main file to current stage dir (/app)
COPY --from=builder /app/main .
# copy /app/migrate.linux-amd64 file to current stage migrate dir (./migrate)
COPY --from=builder /app/migrate.linux-amd64 ./migrate
# copy app.env to current stage workdir
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./migration

# port to exposed when run the app (the same as the env port)
EXPOSE 8080
# command to run binary executable after build
CMD [ "/app/main" ]
# when CMD is used with ENTRYPOINT 
# CMD will became parameter passed to ENTRYPOINT
# its the same as ENTRYPOINT [ "/app/start.sh", "/app/main" ]
ENTRYPOINT [ "/app/start.sh" ]

# NOTE:
# use `docker rmi [IMAGE ID]` to remove builder image