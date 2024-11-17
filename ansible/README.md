# **Ansible Playbooks for Infrastructure Automation**

This repository contains Ansible playbooks to automate the deployment and configuration of a web infrastructure, including Docker, PostgreSQL, Keycloak, and NGINX as a reverse proxy.

---

## **Playbooks Overview**

### 1. **`configure_docker.yml`**
- Installs and configures Docker on the target host.
- Ensures the Docker service is enabled and running.
- Adds the current user to the Docker group for permission management.

---

### 2. **`deploy_postgres.yml`**
- Deploys a PostgreSQL container using the official `postgres` Docker image.
- Configures the container with:
  - Environment variables for database name, user, and password.
  - A volume for persistent storage.

---

### 3. **`deploy_keycloak.yml`**
- Deploys a Keycloak container using the `quay.io/keycloak/keycloak` image.
- Configures Keycloak with:
  - Required environment variables (e.g., admin user and password).
  - PostgreSQL as the backend database.
- Binds Keycloak to the target host’s port for admin console access.

---

### 4. **`deploy_webserver.yml`**
- Deploys an NGINX container configured as a reverse proxy for Keycloak.
- Sets up:
  - SSL certificates for secure HTTPS traffic.
  - Proxy rules to forward traffic to Keycloak.
  - Volumes for NGINX configuration and SSL certificates.

---

## **File Structure**

```plaintext
.
├── configure_docker.yml      # Playbook to install and configure Docker
├── deploy_postgres.yml       # Playbook to deploy PostgreSQL
├── deploy_keycloak.yml       # Playbook to deploy Keycloak
├── deploy_webserver.yml      # Playbook to deploy NGINX as a reverse proxy
├── inventory.ini             # Inventory file for target hosts
│── nginx.conf.j2         # Template for NGINX configuration
├── keycloak.crt          # SSL certificate
├── keycloak.key          # SSL private key

```