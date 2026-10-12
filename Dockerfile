# ── Standalone Frontend image (Nginx + static assets) ──────────────────────────
FROM nginx:1.27-alpine

# Copy web assets to Nginx document root
COPY src/ /usr/share/nginx/html/

# Copy server configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
