FROM node:20-alpine

# Chạy với quyền root để cài đặt
USER root
RUN npm install -g n8n googleapis  # Cài lại n8n và googleapis toàn cục

# Tạo thư mục .n8n và cấp quyền
RUN mkdir -p /home/node/.n8n && chmod -R 777 /home/node/.n8n

# Thiết lập biến môi trường
ENV N8N_DISABLE_SSL_VERIFY=true
ENV N8N_SECURE_COOKIE=false
ENV N8N_PROTOCOL=http
ENV N8N_PORT=5678
ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis  # Cho phép Code Node dùng googleapis

# Chạy với user node
USER node
CMD ["n8n"]
