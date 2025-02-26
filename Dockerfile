FROM n8nio/n8n:latest

# Chạy với quyền root để cài đặt
USER root
RUN apk add --no-cache bash  # Cài bash để dễ sử dụng
RUN npm install -g googleapis

# Tạo thư mục .n8n và cấp quyền
RUN mkdir -p /home/node/.n8n && chmod -R 777 /home/node/.n8n

# Thiết lập biến môi trường
ENV N8N_DISABLE_SSL_VERIFY=true
ENV N8N_PROTOCOL=http
ENV N8N_PORT=5678

# Chạy với user node
USER node
CMD ["n8n"]
