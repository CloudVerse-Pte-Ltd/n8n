# Sử dụng image chính thức của n8n từ Docker Hub
FROM n8nio/n8n:latest

# Cài đặt thư viện googleapis
USER root
RUN npm install -g googleapis

# Quay lại user mặc định của n8n
USER node

# Thiết lập biến môi trường để bỏ qua SSL
ENV N8N_DISABLE_SSL_VERIFY=true
ENV N8N_PROTOCOL=http
ENV N8N_PORT=5678

# Chạy n8n
CMD ["n8n"]
