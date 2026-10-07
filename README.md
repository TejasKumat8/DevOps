# DevOps Coursework

DevOps Engineering Coursework, Automation Scripts & Kubernetes Labs, one folder per topic. Each folder has its own
README with the commands that were run, the output, and screenshots from the run.

| Folder | Topic |
|---|---|
| `Linux Fundamentals/` | Hard vs soft links, `useradd` vs `adduser`, `journalctl`, command cheat sheet |
| `Shell Scripting/` | `sysinfo.sh`: variables, user input, `mkdir`/`touch`, output redirection |
| `Networking Fundamentals/` | `ping`, `ip`, `ss`, `curl`, `wget`, `nslookup`, `traceroute`, `hostname` |
| `Git and Github/` | `git commit -a` vs `-m`, `git cherry-pick` |
| `Docker Fundamentals/` | Six Hello World containers: Node.js, Python, Java, Apache, React, Nginx |
| `DockerFiles and Images/` | Multi-stage Go build, 365 MB toolchain to a 7 MB image |
| `Docker Networks/` | Multi-network containers, host network, bind mounts, overlay networks |
| `Kubernetes Fundamentals/` | Cluster architecture, kube-system Pods, node capacity, first Pod, namespaces |
| `Kubernetes Workloads/` | Pods, ReplicaSets, Deployments, rolling updates and rollback, DaemonSets |
| `Kubernetes Services/` | The five Service types on Minikube: ClusterIP, NodePort, LoadBalancer, Headless, ExternalName |
| `Kubernetes Ingress and Config/` | ConfigMaps, Secrets, and NGINX Ingress routing by host and path |
| `Kubernetes Ingress and Config Advanced/` | ConfigMap/Secret mounts and live updates, Secrets in etcd and Git history, Ingress with and without a controller, TLS, five broken → fixed scenarios |
| `Kubernetes Storage HPA and Probes/` | emptyDir, hostPath, PV/PVC, StorageClass, reclaim policy, HPA scale up/down, liveness/readiness/startup probes, mini project |
| `Kubernetes Troubleshooting/` | Debug commands, 11 common failures (CrashLoopBackOff to OOMKilled), triage gauntlet, mini project |
| `Helm/` | Helm commands, chart scaffolding, upgrade/rollback, dev/prod values mini project |
| `CI-CD GitHub Actions/` | Lint, test and Docker build pipeline with GitHub Actions |
| `DevSecOps Pipeline/` | Secret scanning, SAST, dependency and image scanning, hardened image |
| `Terraform and AWS/` | IAM, EC2, S3, VPC, DynamoDB/RDS and the Terraform workflow (LocalStack) |
| `Cloud Terraform Project/` | VPC, subnets, security group, EC2 with user data and S3 as one Terraform project |
| `Monitoring Observability and GitOps/` | Prometheus, Alertmanager, Loki, Grafana, observability concepts, Argo CD GitOps |
| `Final DevOps Project & Troubleshooting/` | Session 21: three-tier app run manually and with Docker Compose, API tests |

Environment: macOS with Docker Desktop; Linux-only commands were run in Ubuntu 24.04 containers.
The Kubernetes exercises run on a single-node Minikube cluster using the Docker driver. The AWS
exercises run against LocalStack, an AWS emulator in Docker.

Submitted by **Tejas Kumat** (Roll No. 24BCS10301).
