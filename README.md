# WordPress Docker Setup

This repository contains a Docker setup for deploying a WordPress site with Nginx as a reverse proxy and Let's Encrypt for SSL certificates. It uses Docker Compose to manage multiple services, including WordPress, MySQL, Nginx, and Let's Encrypt.

## Overview

The setup includes the following services:

- **WordPress**: The WordPress application, built from a custom Dockerfile.
- **MySQL**: A MySQL database for WordPress.
- **Nginx Proxy**: An Nginx reverse proxy to handle incoming requests and route them to the WordPress container.
- **Let's Encrypt**: A companion container for automatically managing SSL certificates.

## Prerequisites

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Configuration

### Dockerfile

The `Dockerfile` is used to build a custom WordPress image. It copies your WordPress code into the image and sets the correct file permissions.

### docker-compose.yml

The `docker-compose.yml` file defines the services and their configurations:

- **nginx-proxy**: Handles HTTP and HTTPS traffic and routes requests to the appropriate container.
- **letsencrypt**: Manages SSL certificates for the domain specified in `VIRTUAL_HOST`.
- **wordpress**: Runs the WordPress application using the custom image built from the Dockerfile.
- **db**: Provides a MySQL database for WordPress.

### Volumes

The setup uses Docker volumes to persist data:

- `wordpress_data`: Stores WordPress files.
- `db_data`: Stores MySQL data.
- `nginx_certs`, `nginx_vhost`, `nginx_html`: Used by Nginx and Let's Encrypt.

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/roshank8s/wordpress-docker-image-build-ssl.git
   cd wordpress-docker-image-build-ssl

### Update the Configuration

Edit the docker-compose.yml file to set your domain and email address for Let's Encrypt.
Ensure your WordPress code is placed in the directory specified in the Dockerfile.

### Build and Start the Services

`docker-compose up --build -d`

This command builds the custom WordPress image and starts all the services in detached mode.

### Access Your WordPress Site

Open your web browser and navigate to your domain (e.g., http://www.example.com). You should see the WordPress setup page.

### Updating Your WordPress Code
To update your WordPress code, modify the files in the directory specified in the Dockerfile and rebuild the image:

`docker-compose build wordpress`
`docker-compose up -d`

### Troubleshooting
Check Logs: Use docker-compose logs to view logs for debugging.
Restart Services: Restart services with docker-compose restart.
