# Sử dụng image node chính thức làm base
FROM node:20-slim

# Đặt thư mục làm việc
WORKDIR /usr/src/app

# Cài đặt các gói hệ thống cần thiết
RUN apt-get update && apt-get install -y \
    postgresql-client \
    redis-tools \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt n8n toàn cục
RUN npm install -g n8n@latest

# Cài đặt thư viện googleapis cho Node.js
RUN npm install -g @googleapis/drive @googleapis/sheets

# Tạo thư mục dữ liệu cho n8n và cấp quyền
RUN mkdir -p /root/.n8n \
    && chmod -R 755 /root/.n8n

# Thiết lập biến môi trường cho n8n
ENV NODE_TLS_REJECT_UNAUTHORIZED=0
ENV N8N_SKIP_WEBHOOK_DEREGISTRATION_ON_SHUTDOWN=true
# Bật queue mode
ENV N8N_QUEUE_MODE=true
# Cấu hình DB (PostgreSQL thay vì SQLite)
ENV DB_TYPE=postgres
ENV DB_POSTGRESDB_HOST=postgres
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_DATABASE=n8n
ENV DB_POSTGRESDB_USER=n8n
ENV DB_POSTGRESDB_PASSWORD=n8n
# Cấu hình Redis
ENV QUEUE_BULL_REDIS_HOST=redis
ENV QUEUE_BULL_REDIS_PORT=6379

# Mở port mặc định của n8n
EXPOSE 5678

# Khởi động n8n khi container chạy
CMD ["n8n", "start"]
