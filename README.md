# **Keycloak Container Environment on Azure**

## **Overview**
This project involves the creation of a containerized Keycloak environment on an Azure Virtual Machine. The setup includes a Postgres database for Keycloak's backend, a web server hosting a static web page, and a secure configuration where access to the web server is managed through Keycloak.

---

## **Key Features**
- **Infrastructure as Code (IaC):** 
  - All infrastructure components are created using Terraform.
  - Ansible is used for configuration management of the environment.
- **Secure Access Control:**
  - The web server is configured to require authentication via Keycloak.
- **CI/CD Pipelines:** 
  - GitHub Actions automate the deployment, configuration, and disassembly of the environment.

---

## **Architecture**
- **Infrastructure Components:**
  - **Azure VM:** Hosts the containerized environment.
  - **Keycloak Container:** Provides identity and access management.
  - **Postgres Database:** Backend for Keycloak.
  - **Web Server:** Serves a static web page with access controlled by Keycloak.

- **Networking:**
  - Configured with a Virtual Network (VNet) for internal communication.
  - A Network Security Group (NSG) ensures only authorized access.
  - Public IP provided for external access to the web server.

---

## **Technologies Used**
- **Azure:** For cloud infrastructure and services.
- **Terraform:** For infrastructure provisioning.
- **Ansible:** For configuration management and application setup.
- **Docker:** For containerizing Keycloak, Postgres, and the web server.
- **GitHub Actions:** For automating deployment workflows.

---

## **CI/CD Workflows**
1. **Deploy Infrastructure:** 
   - Provisions the VM, VNet, NSG, and other resources using Terraform.
2. **Configure Environment:**
   - Installs Docker, deploys Keycloak and Postgres containers, and sets up the web server using Ansible.
3. **Disassemble Infrastructure:**
   - Destroys all resources when the environment is no longer needed.

---

## **Justifications**
### **Components and Configuration**
- **Azure VM:** Chosen for simplicity and flexibility in hosting containers.
- **Keycloak:** Provides robust identity and access management.
- **Postgres:** Reliable and compatible database for Keycloak.
- **Docker:** Lightweight, efficient containerization for all services.
- **Terraform and Ansible:** Streamline infrastructure and configuration tasks, ensuring repeatability and maintainability.

### **Images**
- **Keycloak:** Official Keycloak Docker image.
- **Postgres:** Official Postgres Docker image, ensuring compatibility and stability.
- **Web Server:** Minimal image (Nginx) to serve the static page efficiently.

### **Network Configuration**
- **Virtual Network:** Ensures secure internal communication.
- **NSG Rules:** Allow controlled access to required services only.

---

## **To be implemented**
- **nginx configuration with Keycloak:** Nginx needs to be able to succesfully transfer requests to Keycloak login page
- **CI/CD final touch for setup:** CD currently doesn't working without a preexisting tfstate. Need to update that to work automatically
- **Docker Compose:** Need to reconfigure to use Docker Compose for better handling of all the containers
- **Use of Load Balancer:** Need to add Load Balancer to infrastructure for better security handling
- **Monitoring:** Integrate Azure Monitor or Prometheus for real-time health checks.
- **Auto-scaling:** Configure automatic scaling based on load.

---

## **Getting Started**
1. Clone the repository.
2. Configure secrets in GitHub Actions for Azure credentials and SSH keys.
3. Run the CI/CD workflows to deploy, configure, or tear down the environment.
4. DON'T USE THIS SETUP IN PRODUCTION!

---

## **References**
- [Azure Free Services](https://azure.microsoft.com/en-us/pricing/free-services/)
- [Terraform on Azure](https://learn.hashicorp.com/collections/terraform/azure-get-started)
- [Ansible Documentation](https://www.ansible.com/resources/get-started)
