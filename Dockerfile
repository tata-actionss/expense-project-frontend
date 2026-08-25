# Use official Nginx image
FROM nginx:1.29-alpine
# Remove default nginx website content
RUN rm -rf /usr/share/nginx/html/*

# Install unzip and curl
RUN apk add --no-cache curl unzip

# Download and extract frontend content
RUN curl -o /tmp/frontend.zip https://expense-joindevops.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip && \
    unzip /tmp/frontend.zip -d /usr/share/nginx/html && \
    rm -f /tmp/frontend.zip

# Copy nginx reverse proxy configuration
#COPY expense.conf /etc/nginx/conf.d/default.conf

# Expose nginx port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
