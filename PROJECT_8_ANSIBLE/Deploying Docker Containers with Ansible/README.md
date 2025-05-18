# 🚀 Automated Docker Deployment with Ansible

This project provides an Ansible-based solution to **automatically install Docker and deploy multiple containers** (Ubuntu, Nginx, Redis) across multiple remote Ubuntu servers.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Inventory Setup](#inventory-setup)
- [Playbook Details](#playbook-details)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Expected Outcome](#expected-outcome)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

---

## Overview

This repository enables you to:

- Install Docker on multiple Ubuntu servers
- Deploy and run Ubuntu, Nginx, and Redis containers with custom port mappings
- Use Ansible for repeatable, automated infrastructure management

---

## Inventory Setup

Create an `inventory.ini` file to define your target servers and SSH connection details:

```ini
[web]
54.91.204.22 ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/pract.pem
44.202.236.226 ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/pract.pem
54.167.231.110 ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/pract.pem
```

- Replace the IP addresses and key path with your own server details.

---

## Playbook Details

The main playbook (`images-install.yml`) will:

- Install Docker and prerequisites
- Deploy three containers:
    - **ubuntu_container**: Runs Ubuntu, stays alive with `sleep infinity`
    - **nginx_container**: Runs Nginx, accessible on port 3002
    - **redis_container**: Runs Redis with persistence, accessible on port 3003

**Sample Playbook:**

```yaml
---
- name: Install Docker and deploy containers
  hosts: all
  become: yes

  vars:
    containers:
      - name: ubuntu_container
        image: ubuntu
        command: sleep infinity
        ports:
          - "3001:80"
      - name: nginx_container
        image: nginx
        ports:
          - "3002:80"
      - name: redis_container
        image: redis
        command: redis-server --appendonly yes
        ports:
          - "3003:6379"

  tasks:
    - name: Install required system packages
      apt:
        name:
          - ca-certificates
          - curl
          - gnupg
          - lsb-release
        state: present
        update_cache: yes

    - name: Add Docker’s official GPG key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add Docker repository
      apt_repository:
        repo: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ ansible_distribution_release }} stable
        state: present

    - name: Install Docker Engine
      apt:
        name: docker-ce
        state: present
        update_cache: yes

    - name: Ensure Docker is running
      service:
        name: docker
        state: started
        enabled: yes

    - name: Deploy containers
      docker_container:
        name: "{{ item.name }}"
        image: "{{ item.image }}"
        command: "{{ item.command | default(omit) }}"
        published_ports: "{{ item.ports | default(omit) }}"
        state: started
        restart_policy: always
      loop: "{{ containers }}"
```


---

## Prerequisites

- **Ansible** installed on your local machine
  - Update the package index and upgrade installed packages:

  ```bash
      sudo apt update
      sudo apt upgrade -y
  ```
  -  Add the Ansible Repository (Optional for Latest Version)
     For the latest Ansible version, add the official Ansible PPA:
     
     ```bash
     sudo apt-add-repository --yes --update ppa:ansible/ansible
    ```
  - Install Ansible
    Install Ansible using APT:
    
    ```bash
    sudo apt install ansible -y
    ```
`- SSH access to all target servers (with the correct private key) using my adapted script called **multi_scp_upload.sh**
- Target three servers running **Ubuntu 18.04/20.04/22.04** from aws vm

---

## Usage

1. **Clone this repository:**

```sh
git clone https://github.com/yourusername/ansible-docker-deploy.git
cd ansible-docker-deploy
```

2. **Edit `inventory.ini`** with your server details.
3. **Run the playbook:**

```sh
ansible-playbook -i inventory.ini images-install.yml
```


---

## Expected Outcome

- Docker will be installed on all listed servers.
- Three containers (Ubuntu, Nginx, Redis) will be running, each mapped to a unique port:
    - Ubuntu: Host port 3001 → Container port 80
    - Nginx: Host port 3002 → Container port 80
    - Redis: Host port 3003 → Container port 6379

---

## Customization

- **Add/Remove Containers:** Edit the `containers` variable in the playbook.
- **Change Images/Ports:** Adjust the `image` and `ports` fields as needed.

---

## Troubleshooting

- **SSH Issues:** Ensure your private key path and permissions are correct.
- **Docker Install Fails:** Check your server’s OS version and network connectivity.
- **Port Conflicts:** Make sure the host ports (3001, 3002, 3003) are not in use.

---

**Happy automating! 🚀**
For questions or contributions, open an issue or pull request.
