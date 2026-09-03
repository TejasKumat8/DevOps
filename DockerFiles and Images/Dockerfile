# Stage 1: Compile Go binary with toolchain
FROM golang:1.23-alpine AS builder
WORKDIR /src
COPY main.go .
RUN go mod init hello-multistage >/dev/null 2>&1 \
 && CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /out/hello .

# Stage 2: Minimal scratch runtime
FROM scratch
COPY --from=builder /out/hello /hello
EXPOSE 8080
ENTRYPOINT ["/hello"]
