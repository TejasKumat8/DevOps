# Dockerfiles & Images — Multi-Stage Build Optimization

## Fundamentals of Multi-Stage Builds

Compiled languages (e.g. Go, Java, C++) require heavy compilers and SDK toolchains to build binaries, but only require minimal execution environments at runtime. Single-stage Docker builds ship entire compiler suites, source code, and build caches inside production images.

Multi-stage Docker builds separate build pipelines into distinct stages:
- **Build Stage (`FROM ... AS builder`)**: Compiles binary artifacts using full SDK environment toolchains.
- **Runtime Stage (`FROM scratch` or minimal distro)**: Copies *only* compiled production binaries from the build stage using `COPY --from=builder`.

## Application Architecture

`main.go` implements a lightweight HTTP server listening on port 8080.
- Endpoint `/`: Returns dynamic greeting string outputting Go compiler version and container hostname.
- Endpoint `/health`: Returns HTTP 200 `ok` health check status.

```go
package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"runtime"
)

func main() {
	host, _ := os.Hostname()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello World from a %s binary running in container %s\n", runtime.Version(), host)
	})
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		fmt.Fprintln(w, "ok")
	})

	log.Println("Listening on port 8080...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
```

## Optimized Dockerfile Configuration

```dockerfile
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
```

### Engineering Details

- `CGO_ENABLED=0`: Produces a statically linked C-library-independent Go binary capable of running on `scratch` (an empty root filesystem image).
- `-ldflags="-s -w"`: Strips debugging information and symbol tables, reducing final binary footprint.
- Stage naming (`AS builder`): Enables explicit stage target referencing.
- JSON Exec Form (`ENTRYPOINT ["/hello"]`): Ensures direct binary invocation without requiring `/bin/sh`.

## Build, Run, and Verification Workflow

```bash
docker build -t hello-multistage .
docker run -d --name multistage -p 8080:8080 hello-multistage

curl http://localhost:8080
# Output: Hello World from a go1.23.12 binary running in container 3a4b23739a8c

curl http://localhost:8080/health
# Output: ok

docker ps --filter name=multistage
docker logs multistage
```

## Image Footprint Reduction

| Stage Image Context | Image Size |
|---|---|
| `golang:1.23-alpine` (Build Base Image) | 365 MB |
| `hello-multistage` (Final Production Image) | 6.98 MB |

*Result*: The final production image footprint represents ~2% of the initial SDK build image size.

## Execution Screenshots

Build output, execution status (`docker ps`), endpoint verification via `curl`, log output, and image footprint metrics:

![build, run, ps](screenshots/build-run-ps.png)

Browser response verification on port 8080:

![app in browser](screenshots/app-in-browser.png)

---

## Multi-Language Deployment Summary

The `Docker Fundamentals/` directory in this repository contains source code and Dockerfiles for six application stacks. Three core language runtimes demonstrate distinct deployment strategies:

| Language | Directory Location | Base Image | Container Port | Reference Screenshot |
|---|---|---|---|---|
| Node.js | `Docker Fundamentals/nodejs-app` | `node:20-alpine` | 3000 | `Docker Fundamentals/screenshots/nodejs.png` |
| Python | `Docker Fundamentals/python-app` | `python:3.12-slim` | 5000 | `Docker Fundamentals/screenshots/python.png` |
| Java | `Docker Fundamentals/java-app` | `eclipse-temurin:21-jdk` | 8080 | `Docker Fundamentals/screenshots/java.png` |
---

**Tejas Kumat** · Roll No. 24BCS10299
