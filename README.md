# Node.js Backend Deployment on AWS EC2  
(Docker, Nginx, HTTPS, CI/CD, PM2)

This project demonstrates a **production-style deployment** of a Node.js backend application on AWS EC2.  
It focuses on how backend services are **containerized, secured, and automatically deployed** using modern DevOps practices.

The goal of this project is not just to “make it work”, but to understand **how real-world backend systems are deployed and maintained**.

---

##  Live Endpoint

- Health Check:  
  https://api.okorojeremiah.online/health

---

##  Architecture Overview

### High-Level Architecture Diagram

![Architecture Diagram](docs/architecture.png)

> Diagram created with **draw.io** to visualize traffic flow and infrastructure components.

### Traffic Flow

Client
│
│ HTTPS (443)
▼
Nginx (Reverse Proxy)
│
│ HTTP (internal)
▼
Docker Container
│
▼
PM2 (Process Manager)
│
▼
Node.js Backend (Port 3000)


---

##  Tech Stack

- **Backend:** Node.js (Express)
- **Compute:** AWS EC2 (Amazon Linux 2)
- **Containerization:** Docker
- **Process Management:** PM2 (`pm2-runtime`)
- **Reverse Proxy:** Nginx
- **Security:** HTTPS with Let’s Encrypt (Certbot)
- **CI/CD:** GitHub Actions
- **DNS:** Custom domain with A record

---

##  Key Features

- Dockerized Node.js backend
- Nginx reverse proxy (no direct public access to app port)
- HTTPS with automatic certificate renewal
- CI/CD pipeline for automatic deployments
- PM2 for application resilience and restarts
- Clean Git practices using `.gitignore` and `.dockerignore`
- Separation of human SSH access and CI/CD access

---

##  CI/CD Workflow (GitHub Actions)

On every push to the `main` branch:

1. GitHub Actions pipeline is triggered
2. Workflow securely connects to EC2 via SSH
3. Latest code is pulled from GitHub
4. Docker image is rebuilt
5. Existing container is replaced
6. Updated version is deployed automatically

This removes the need for manual SSH-based deployments.

---

##  Security Considerations

- Application runs behind Nginx (ports **80 / 443 only**)
- Backend application port (**3000**) is private
- HTTPS enforced with HTTP → HTTPS redirect
- Separate SSH keys for:
  - Human access
  - CI/CD automation
- Secrets stored securely in GitHub Actions Secrets

---

##  Project Structure

├── Dockerfile
├── ecosystem.config.js
├── server.js
├── package.json
├── package-lock.json
├── .gitignore
├── .dockerignore
├── .github/
│ └── workflows/
│ └── deploy.yml
└── docs/
├── architecture.png
└── screenshots/


---

## 🧪 Health Check Endpoint

The backend exposes a health endpoint used for validation and monitoring:

GET /health

Response:
```json
{ "status": "ok" }



##  Screenshots

### Live HTTPS Health Check
![HTTPS Health Check](docs/screenshots/https-health-check.png)

### CI/CD Pipeline (GitHub Actions)
![GitHub Actions](docs/screenshots/github-actions-success.png)

### EC2 Instance Running
![EC2 Instance](docs/screenshots/ec2-instance-running.png)

### Docker Container Running
![Docker Container](docs/screenshots/docker-container-running.png)

### PM2 Process Status
![PM2 Status](docs/screenshots/pm2-status.png)


## Key Learnings

Difference between local development and production deployment

Why reverse proxies are used in front of backend services

How HTTPS terminates at Nginx instead of the application

Importance of separating human access from CI/CD automation

Debugging container restart loops using logs

How CI/CD pipelines reduce deployment risk and manual work


 Notes

This project was built as a learning-focused DevOps portfolio project.
It reflects real production patterns while remaining beginner-friendly and transparent.


 Author

Built by [Onyedika Okoro]
Cloud / DevOps Engineer (Early Career)