FROM n8nio/n8n:latest

# Chạy với quyền root để cài đặt module bên ngoài
USER root
RUN npm install -g googleapis

# Chạy với user node để tránh lỗi quyền hạn
USER node
