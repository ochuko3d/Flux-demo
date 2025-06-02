FROM nginx:1.25-alpine

# Remove default config and create writable temp directories
RUN rm -rf /etc/nginx/conf.d/* && \
    mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chmod -R 755 /var/cache/nginx

# Copy custom configuration and content
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/

# Switch to non-root user and set permissions
USER nginx

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
    CMD curl -f http://localhost:8080/ || exit 1

EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]