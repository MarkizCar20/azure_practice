# Terraform Configuration for Azure Infrastructure

This project uses Terraform to provision the infrastructure required to host a Keycloak server, PostgreSQL database, and a web server on Microsoft Azure.

## Table of Contents
1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Resources Provisioned](#resources-provisioned)
4. [Usage](#usage)
5. [Drawbacks and Improvements](#drawbacks-and-improvements)

---

## Overview

This Terraform configuration deploys:
- A Linux Virtual Machine (VM) for hosting Keycloak, PostgreSQL, and a web server.
- A Virtual Network (VNet) for secure resource communication.
- A Public IP for SSH and web access.
- A Network Security Group (NSG) for traffic control.

---

## Architecture

The infrastructure includes:
- **Resource Group**: Groups all resources for better organization and management.
- **Virtual Network (VNet)**: Provides a secure and isolated network environment.
- **Subnets**: Segments the VNet for better traffic control and isolation.
- **Public IP**: Allows external access to the VM.
- **Network Security Group (NSG)**: Controls inbound and outbound traffic.
- **Network Interface (NIC)**: Connects the VM to the VNet and attaches the NSG and Public IP.
- **Linux Virtual Machine**: Hosts the application stack.

---

## Resources Provisioned

### 1. **Resource Group**
- Groups all resources for easier lifecycle management.
- **Drawbacks**: Deleting the group removes all contained resources.

### 2. **Virtual Network (VNet)**
- **Purpose**: Provides an isolated network environment.
- **Configuration**:
  - Address Space: `10.0.0.0/16`

### 3. **Subnets**
- **Purpose**: Divides the VNet for resource segmentation.
- **Configuration**:
  - Subnet Address Prefix: `10.0.1.0/24`

### 4. **Public IP**
- **Purpose**: Enables external access to the VM.
- **Configuration**:
  - Static allocation ensures the IP remains the same across reboots.
  - Standard SKU ensures reservation and availability.
- **Drawbacks**: Exposes the VM to the internet, increasing the attack surface.

### 5. **Network Security Group (NSG)**
- **Purpose**: Controls inbound and outbound traffic.
- **Configuration**:
  - Allows SSH (port 22) from all sources.
- **Drawbacks**: Unrestricted SSH access is a security risk. Restrict access to trusted IPs.

### 6. **Network Interface (NIC)**
- **Purpose**: Connects the VM to the VNet and assigns a public IP and NSG.

### 7. **Linux Virtual Machine**
- **Purpose**: Hosts Keycloak, PostgreSQL, and the web server.
- **Configuration**:
  - OS: Ubuntu 18.04
  - Size: `Standard_DS1_v2` (suitable for light workloads)
  - Secure SSH login with public key authentication.
- **Drawbacks**: Not highly available; a single instance is prone to failure.

### 8. **Outputs**
- Provides the public IP address of the VM for quick access.

---

## Usage

### Prerequisites
1. Install Terraform: [Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. Configure Azure CLI and authenticate:
   ```bash
   az login
