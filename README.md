# DevOps Engineering Coursework & Lab Exercises

Hands-on practical implementation notes, scripts, and containerized applications built during the DevOps coursework. Each module directory contains a dedicated README featuring exact command execution sequences, detailed runtime output summaries, and verified execution screenshots.

## Module Directory Structure

| Module Directory | Topic Overview |
|---|---|
| Linux Fundamentals/ | Inode deep-dive (hard vs symbolic links), account creation utilities (useradd vs dduser), system service logging with journalctl, and essential Linux command cheat sheet. |
| Shell Scripting/ | sysinfo.sh automated system diagnostics script utilizing environment variables, user prompt handling, dynamic directory creation, and output redirection (>). |
| Networking Fundamentals/ | Comprehensive practical breakdown of core networking tools: ping, ip, ss, curl, wget, 
slookup, 	raceroute, and hostname. |
| Git and Github/ | In-depth exploration of Git staging area semantics (git commit -m vs -a -m) and targeted commit migration using git cherry-pick. |
| Docker Fundamentals/ | Multi-language container deployments: Node.js, Python/Flask, Java, Apache HTTP Server, React (Vite multi-stage), and Nginx. |
| DockerFiles and Images/ | Optimized multi-stage Docker build for Go binaries, reducing build environment size from ~365 MB down to ~7 MB on a minimal scratch image. |
| Docker Networks/ | Container isolation with custom bridge networks, host networking mode, bind mounts, and distributed overlay network architecture. |
| Kubernetes Fundamentals/ | Minikube cluster architecture, control plane components (kube-apiserver, etcd, kubelet), kube-system static pods, node capacity allocation, first Pod lifecycle events, and namespace isolation. |
| Kubernetes Workloads/ | Orchestration objects: bare Pods vs ReplicaSets (self-healing & scaling), Deployments (zero-downtime rolling updates, change history & rollbacks), and DaemonSets (node-level agents). |
| Kubernetes Services/ | In-cluster service discovery & network exposure patterns: ClusterIP, NodePort, LoadBalancer, Headless (DNS stateful services), and ExternalName. |
| Kubernetes Ingress and Config/ | External HTTP application routing with NGINX Ingress Controller, decoupled environment configuration via ConfigMaps, base64-encoded Secrets, and environment variable injection. |

## Test Environment Context
- **Primary OS**: macOS / Linux Workstation running Docker Desktop & Minikube (v1.37.0).
- **Container Operations**: Commands requiring specific Linux kernel interfaces were executed inside an isolated ubuntu:24.04 container environment.
- **Kubernetes Environment**: Single-node Minikube cluster running on the Docker driver.
---

**Tejas Kumat** · Roll No. 24BCS10299
