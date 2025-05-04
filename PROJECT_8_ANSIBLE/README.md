---

Ansible Automation: Dockerized Services \& NGINX on AWS Ubuntu

Automate the installation of Docker, deployment of containers (Ubuntu, NGINX, Redis), and configuration of NGINX web servers on AWS EC2 Ubuntu instances using Ansible.

---

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Inventory Setup](#inventory-setup)
- [Playbooks](#playbooks)
  - [1. Docker \& Containers Deployment](#1-docker--containers-deployment)
  - [2. NGINX Installation \& Configuration](#2-nginx-installation--configuration)
- [Usage](#usage)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [References](#references)

---

## Overview

This repository provides Ansible playbooks to:

- Install Docker and Python Docker modules
- Deploy Ubuntu, NGINX, and Redis containers with custom port mappings
- Install and configure the NGINX web server with a custom index page

These playbooks are designed for AWS EC2 Ubuntu instances but can be adapted for any Ubuntu server.

---

## Prerequisites

Before you begin, ensure you have the following:

- **Ansible installed on your local machine or a management host**
    - [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
    - For Ubuntu:

```sh
sudo apt update
sudo apt install -y ansible
```

- **An AWS EC2 Ubuntu instance running and accessible**
    - The instance should be reachable via its public IP address.
- **Your SSH private key (`.pem` file)**
    - Downloaded from AWS and stored securely on your local machine.
- **[Termius](https://termius.com/) for SSH connection management (optional but recommended)**
    - Use Termius to manage SSH connections and keys for quick, secure access to your EC2 instance.
- **Ansible inventory file (`inventory.ini`)** with your instance details (see [Inventory Setup](#inventory-setup))
- **Internet access** on the target instance for package installation and Docker image pulls.

---

## Inventory Setup

Create an `inventory.ini` file in your project directory. Example:

```ini
[web]
54.227.2.228 ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/pract.pem
```

- Replace `54.227.2.228` with your EC2 instance’s public IP.
- Replace `/path/to/pract.pem` with the actual path to your PEM file on your Ansible control machine.

---

## Playbooks

### 1. Docker \& Containers Deployment

**File:** `images-install.yml`

Installs Docker and deploys three containers: Ubuntu, NGINX, and Redis.
Each container is mapped to a unique port on the host.

<details>
<summary>Click to view playbook details</summary>

```yaml
- name: Install Docker and deploy containers
  hosts: all
  become: yes
  vars:
    containers:
      - name: ubuntu_container
        image: ubuntu
        command: sleep infinity  # Keeps the container running
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
    - name: Install required packages
      apt:
        name:
          - ca-certificates
          - curl
          - gnupg
          - lsb-release
          - python3-pip
        state: present
        update_cache: yes

    - name: Add Docker GPG key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add Docker repository
      apt_repository:
        repo: "deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ ansible_distribution_release }} stable"
        state: present

    - name: Install Docker CE
      apt:
        name: docker-ce
        state: present

    - name: Install Docker Python module
      apt:
        name: python3-docker
        state: present

    - name: Ensure Docker service is running
      service:
        name: docker
        state: started
        enabled: yes

    - name: Pull images
      community.docker.docker_image:
        name: "{{ item.image }}"
        source: pull
      loop: "{{ containers }}"

    - name: Create and start containers
      community.docker.docker_container:
        name: "{{ item.name }}"
        image: "{{ item.image }}"
        command: "{{ item.command | default(omit) }}"
        ports: "{{ item.ports | default(omit) }}"
        state: started
        restart_policy: unless-stopped
      loop: "{{ containers }}"
```

</details>

---

### 2. NGINX Installation \& Configuration

**File:** `nginx-install.yml`

Installs NGINX and deploys a custom index page on hosts in the `[web]` group.

<details>
<summary>Click to view playbook details</summary>

```yaml
- name: Deploy and configure NGINX
  hosts: web
  become: yes
  tasks:
    - name: Install NGINX
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Ensure NGINX is running
      service:
        name: nginx
        state: started
        enabled: true

    - name: Deploy custom index page
      copy:
        content: "<h1>Hello from {{ inventory_hostname }}</h1>"
        dest: /var/www/html/index.html
```

</details>

---

## Usage

1. **Clone this repository (or copy the playbooks and inventory file to your Ansible control machine).**
2. **Ensure your inventory file is correct and your PEM key has the right permissions:**

```sh
chmod 600 /path/to/pract.pem
```

3. **Test Ansible connectivity:**

```sh
ansible -i inventory.ini all -m ping
```

4. **Run the Docker and containers playbook:**

```sh
ansible-playbook -i inventory.ini images-install.yml
```

5. **Run the NGINX installation playbook:**

```sh
ansible-playbook -i inventory.ini nginx-install.yml
```


---

## Customization

- **Add or modify containers** in `images-install.yml` under the `containers` variable.
- **Change the NGINX index page** content in `nginx-install.yml` under the `copy` task.
- **Adjust inventory** as needed for multiple hosts or different groups.

---

## Troubleshooting

- **SSH errors:** Ensure your PEM key path is correct and permissions are set to `600`.
- **Ansible not found:** Make sure Ansible is installed and available in your PATH.
- **Docker or NGINX not installing:** Ensure your EC2 instance has internet access and security groups allow outbound connections.
- **Permission denied:** Use `become: yes` in your playbooks to run tasks with sudo privileges.

---

## References

- [Ansible Documentation](https://docs.ansible.com/)
- [Docker Documentation](https://docs.docker.com/)
- [NGINX Documentation](https://nginx.org/en/docs/)
- [Termius](https://termius.com/)

---

**Happy automating!**
For questions or contributions, please open an issue or pull request.

---

<div style="text-align: center">⁂</div>

[^1]: images-install.yml

[^2]: inventory.ini

[^3]: nginx-install.yml

