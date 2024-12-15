# Use the official nginx image from Docker Hub
FROM nginx:alpine

# Copy the index.html file to the nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to access the nginx web server
EXPOSE 80
