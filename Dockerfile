FROM n8nio/n8n:latest

# Chạy với quyền root để cài đặt module bên ngoài
USER root
RUN npm install --prefix /usr/local/lib/node_modules googleapis

# Cấp quyền thư mục để tránh lỗi quyền hạn khi chạy với user node
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Chạy với user node để tránh lỗi quyền hạn
USER node
