# Simple Website using Docker

This project demonstrates how to host a simple static website using Docker. It's designed to help you get familiar with hosting an application on a virtual machine (VM) in the cloud.

### Prerequisites

- A Linux-based VM (e.g., Ubuntu, Kali) in the cloud.
- Basic familiarity with Docker and Linux commands.

### Steps to Run the Project

1. **Install Docker on your VM**

   Use the following command to install Docker on your VM:

   ```bash
   sudo apt update 
   sudo apt install docker.io
   ```

   > [!Note:]
   > For more detailed information, refer to the [official Docker documentation for Ubuntu](https://docs.docker.com/engine/install/ubuntu/).

2. **Clone this Repository**

   Clone the repository containing the project files to your local directory:

   ```bash
   git clone "https://github.com/abdelbasse/Simple-Website.git"
   cd Simple-Website
   ```

3. **Build and Run the Docker Container**

   Use the `Dockerfile` included in the repository to build and run the container:

   ```bash
   docker build -t simple-nginx .
   docker run -d -p 80:80 simple-nginx
   ```

   This will:
   - Build a Docker image named `simple-nginx`.
   - Start a container based on this image, mapping port 80 of the container to port 80 of your VM.

Here's the updated and fixed section of your documentation with the additional troubleshooting steps and UFW configuration:

4. **Access the Website**

   Open a web browser and navigate to your VM's public IP address (e.g., `http://<your-vm-ip>`). You should see the website hosted by NGINX.

   > **Note:** 
   > - Make sure to copy the **public IP address** of your VM.
   > - Verify that your firewall rules allow inbound and outbound traffic for the required ports.

   If the website is not working, you may need to configure your firewall settings **(in VM)**. Use the following steps to check and enable the necessary rules:

   1. **Install UFW (Uncomplicated Firewall)**

      If UFW is not already installed, you can install it with:

      ```bash
      sudo apt update
      sudo apt install ufw
      ```

   2. **Enable UFW and Add Rules**

      Enable UFW and allow traffic for HTTP (port 80) and HTTPS (port 443):

      ```bash
      sudo ufw allow 80/tcp
      sudo ufw allow 443/tcp
      sudo ufw enable
      ```

   3. **Verify UFW Status**

      Check the current firewall rules to ensure they are properly configured:

      ```bash
      sudo ufw status
      ```

   After applying these steps, try accessing your website again via `http://<your-vm-ip>`.

--- 

### How it Works

The `Dockerfile` in this project uses NGINX to serve the static website:

```dockerfile
# Use the official nginx image from Docker Hub
FROM nginx:alpine

# Copy the index.html file to the nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to access the nginx web server
EXPOSE 80
```

- **Base Image:** The `nginx:alpine` image is a lightweight version of NGINX, ideal for serving static content.
- **Copy Files:** The `index.html` file from your project is copied into NGINX's default HTML directory.
- **Expose Port 80:** This makes the container's web server accessible via HTTP requests on port 80.

---

**Still not working?** 🧐 Maybe it's time to take a break, sip some coffee, and head over to [Stack Overflow](https://stackoverflow.com)—where the real troubleshooting magic happens! ✨  

> **Note:** I can't cover every possible scenario for this simple project test, but troubleshooting is part of the fun!
