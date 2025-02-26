FROM n8nio/n8n:latest

# Chạy với quyền root để cài đặt module bên ngoài
USER root
RUN npm install --prefix /usr/local/lib/node_modules googleapis

# Cấp quyền thư mục để tránh lỗi quyền hạn khi chạy với user node
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Thiết lập biến môi trường
ENV N8N_DISABLE_SSL_VERIFY=true
ENV N8N_SECURE_COOKIE=false
ENV N8N_PROTOCOL=http
ENV N8N_PORT=5678
ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis
ENV PATH="/usr/local/lib/node_modules/n8n/node_modules/.bin:$PATH"

# Chạy với user node để tránh lỗi quyền hạn
USER node
WORKDIR /home/node

CMD ["n8n"]
