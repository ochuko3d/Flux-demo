FROM nginx:alpine

# Create necessary directories and set permissions before switching user
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chmod -R 755 /var/cache/nginx && \
    chown -R nginx:nginx /var/run && \
    chown -R nginx:nginx /etc/nginx

# Use the non-root nginx user that comes with official image
USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]