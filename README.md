<p align="center">
  <img src="https://github.com/maaloum-yassine/42/blob/main/logo_project42/inceptionn.png" alt="Cub3D 42 project badge"/>
</p>

## 🎥 Score 🥇✅
<p align="center">
  <img src="https://github.com/maaloum-yassine/42/blob/main/score/Inception42.png" alt="Score 42 project 125"/>
</p>

---

## 🎥 **Demo Video**
<div align="center">
  <strong style="font-size: 20px; color: #0073e6;">Click below to watch the Inception42 project:</strong>  
  <br>
  <a href="https://vimeo.com/1065029898" style="font-size: 22px; font-weight: bold; color: #FF6347; text-decoration: none; background-color: #f0f0f0; padding: 15px 30px; border-radius: 8px; border: 2px solid #FF6347;">
    ➡️ **[Watch my Inception_42 on Vimeo]** ⬅️
  </a>
</div>

---

## Project Overview
The goal of this project is to create a complete infrastructure using Docker to deploy multiple services such as MariaDB, WordPress, Nginx, Redis, Adminer, an FTP server, etc.

# Prerequisites
Make sure you have installed all of the following prerequisites on your machine:
- Docker
- Docker compose
# Set up your environment
### Edit /etc/hosts to add your server name
``` 127.0.0.1 ymaaloum.42.fr adminer.42.fr anon.42.fr  ```
---

## Project Structure
The project contains the following services:

- **mariadb**: Contains the MariaDB database.
- **wordpress**: Contains the WordPress application.
- **nginx**: Nginx server configured to be used as a reverse proxy.
- **adminer**: Web interface to manage the MariaDB database.
- **anon**: Simple static website.
- **cadvisor**: Docker resource monitoring tool.
- **redis**: Redis cache to optimize WordPress performance.
- **ftp-server**: FTP server for file transfer.

---

### Run Services
```bash
~ git clone git@github.com:maaloum-yassine/Inception.git
~ cd Inception
~ make
```
open your browser and tap :
- ymaaloum.42.fr -> wordpress website
- adminer.42.fr -> adminer website
- anon.42.fr -> static website
# Resources
- [What is Virtualization](https://dev.to/alubhorta/what-is-virtualization-bare-metal-vs-virtual-machines-vs-containers-99a)
- [What is Docker](https://dev.to/alubhorta/what-is-docker-docker-made-easy-part-1-him)
- [How do Docker Images work?](https://dev.to/alubhorta/how-do-docker-images-work-docker-made-easy-part-2-1b41)
- [The Docker Container Lifecycle](https://dev.to/alubhorta/the-docker-container-lifecycle-docker-made-easy-3-554o)
- [How do Docker Volumes work?](https://dev.to/alubhorta/how-do-docker-volumes-enable-persistence-for-containers-docker-made-easy-4-5fgc)
- [Why is Networking important in Docker? ](https://dev.to/alubhorta/why-is-networking-important-in-docker-networking-in-docker-1-3mef)
- [Basics of Networking ](https://dev.to/alubhorta/basics-of-networking-networking-in-docker-2-2jl9)
- [Docker Network Drivers Overview](https://dev.to/alubhorta/docker-network-drivers-overview-30c)
- [The Bridge Network Driver ](https://dev.to/alubhorta/the-bridge-network-driver-networking-in-docker-6-1ahf)
- [What is Docker Compose? ](https://dev.to/alubhorta/what-is-docker-compose-with-demo-bfp)
- [How to Configure PHP-FPM with NGINX](https://www.digitalocean.com/community/tutorials/php-fpm-nginx)
- [How To Create a Self-Signed SSL Certificate for Nginx](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-20-04-1)

