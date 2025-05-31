FROM nginx:alpine

# Minimal setup for port 80
RUN rm /etc/nginx/conf.d/default.conf && \
    chown -R nginx:nginx /var/cache/nginx

# Run as nginx user (non-root)
USER nginx

# Expose standard HTTP port
EXPOSE 80

# Standard nginx start
CMD ["nginx", "-g", "daemon off;"]