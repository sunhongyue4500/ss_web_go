# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:1.13.7

# Add Maintainer Info
LABEL maintainer="hongyi <hong6yi@gmail.com>"

COPY . /go/src
WORKDIR /go/src

# Set the Current Working Directory inside the container

# Copy go mod and sum files
#COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
#RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container

# Build the Go app
RUN go install ss_go_web.go

# Build the golang-docker command inside the container.


# Run the golang-docker command when the container starts.
ENTRYPOINT /go/bin/ss_go_web

# Expose port 8080 to the outside world
EXPOSE 7777

# Command to run the executable
#CMD ["./main"]