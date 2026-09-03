# DevOps Engineering Coursework & Lab Exercises

Hands-on practical implementation notes, scripts, and containerized applications built during the DevOps coursework. Each module directory contains a dedicated README featuring exact command execution sequences, detailed runtime output summaries, and verified execution screenshots.

## Module Directory Structure

| Module Directory | Topic Overview |
|---|---|
| `Linux Fundamentals/` | Inode deep-dive (hard vs symbolic links), account creation utilities (`useradd` vs `adduser`), system service logging with `journalctl`, and essential Linux command cheat sheet. |
| `Shell Scripting/` | `sysinfo.sh` automated system diagnostics script utilizing environment variables, user prompt handling, dynamic directory creation, and output redirection (`>`). |
| `Networking Fundamentals/` | Comprehensive practical breakdown of core networking tools: `ping`, `ip`, `ss`, `curl`, `wget`, `nslookup`, `traceroute`, and `hostname`. |
| `Git and Github/` | In-depth exploration of Git staging area semantics (`git commit -m` vs `-a -m`) and targeted commit migration using `git cherry-pick`. |
| `Docker Fundamentals/` | Multi-language container deployments: Node.js, Python/Flask, Java, Apache HTTP Server, React (Vite multi-stage), and Nginx. |
| `DockerFiles and Images/` | Optimized multi-stage Docker build for Go binaries, reducing build environment size from ~365 MB down to ~7 MB on a minimal `scratch` image. |
| `Docker Networks/` | Container isolation with custom bridge networks, host networking mode, bind mounts, and distributed overlay network architecture. |

## Test Environment Context
- **Primary OS**: macOS / Linux Workstation running Docker Desktop.
- **Linux Operations**: Commands requiring specific Linux kernel interfaces were executed inside an isolated `ubuntu:24.04` container environment.
