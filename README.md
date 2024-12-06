# **Inception Project**

Welcome to the **Inception Project** repository, part of the curriculum at [École 42](https://www.42.fr/). This project focuses on containerization and orchestration, leveraging tools like Docker and Docker Compose to deploy a robust multi-service architecture.

---

## **Overview**

The goal of this project is to explore the principles of containerization by creating and managing a multi-service environment. You will deploy services in isolated containers, ensuring they interact seamlessly and meet the requirements of modern development and deployment practices.

By the end of the project, you will have a deeper understanding of:
- Docker and containerization.
- Networking between containers.
- Configuring services like NGINX, MariaDB, and WordPress.
- Persisting data and managing volumes.
- Ensuring security and proper resource allocation.

---

## **Objectives**

- Set up a **multi-container architecture** using Docker and Docker Compose.
- Create and configure services such as:
  - **NGINX**: as a reverse proxy.
  - **MariaDB**: for database management.
  - **WordPress**: as a content management system.
- Use volumes to ensure data persistence.
- Isolate services to guarantee secure communication.
- Implement best practices for Dockerfile and Compose configurations.

---

## **Requirements**

To successfully complete this project, your environment must meet the following requirements:
- Docker: Version 20.10 or higher.
- Docker Compose: Version 1.29 or higher.
- A virtual machine with **Debian 11** or a similar Linux distribution.

---

## **Installation**

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/inception-project.git
   ```
2. Build the Docker containers using Docker Compose:
  ```bash
  docker-compose up --build
  ```
3. Access the services:
  - NGINX: http://localhost
  - WordPress: http://localhost (use the credentials provided in your .env file).
  - MariaDB: Accessible through a database client (host: mariadb, port: 3306).

---

## **File Structure**
Below is an overview of the project directory structure:
```bash
inception-project/
├── srcs/
│   ├── requirements/
│   │   ├── nginx/              # Configuration files for NGINX
│   │   ├── wordpress/          # WordPress setup and customization
│   │   └── mariadb/            # MariaDB database setup
│   └── docker-compose.yml      # Main Compose file
├── Makefile                    # Makefile for building and managing containers
├── .env                        # Environment variables
└── README.md                   # Project documentation
```

---

## **Environment Variables**
Create a .env file at the root of the project to manage sensitive information such as database credentials. Example:
```env
DB_NAME=wordpress
DB_USER=wp_user
DB_PASSWORD=securepassword
DB_ROOT_PASSWORD=rootpassword
```

---

# Usage

## **`make all`**
- Installs the required folders and starts the Docker containers in build mode, monitoring changes.
- Displays the status of the containers afterward.

## **`make install`**
- Creates the folders needed for persistent volumes:
  - `/Users/${USER}/data/www` for WordPress files.
  - `/Users/${USER}/data/database` for MariaDB data.
- Copies the `.env` file to the `srcs` directory.

## **`make status`**
- Displays the current status of all containers (running or stopped).

## **`make logs`**
- Shows the real-time logs of the containers.

## **`make nginx`**
- Opens a bash session inside the NGINX container.

## **`make mariadb`**
- Opens a bash session inside the MariaDB container.

## **`make wordpress`**
- Opens a bash session inside the WordPress container.

## **`make fclean`**
- Stops all Docker containers and removes the following volumes:
  - `inception_www`
  - `inception_database`
- Cleans up unused system files with `docker system prune`.
- Removes the `.env` file from the `srcs` directory.

## **`make superclean`**
- Performs the same steps as `fclean`.
- Additionally, deletes the `/Users/${USER}/data` folder.

## **`make re`**
- Fully resets the project by running `fclean` followed by `all`.

---

## **Features**
  - Reverse Proxy: Secure and efficient routing using NGINX.
  - Database Management: A robust MariaDB setup for WordPress data.
  - CMS Deployment: Fully operational WordPress site with persistent storage.
