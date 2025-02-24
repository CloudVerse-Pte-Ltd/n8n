# Sử dụng n8n chính thức
FROM n8nio/n8n:latest

# Chuyển sang user root để cài đặt
USER root

# Cài đặt thư viện Google APIs
RUN npm install -g googleapis

# Đặt lại quyền cho user node
RUN chown -R node:node /home/node

# Chuyển về user node để chạy n8n
USER node

# Đặt biến môi trường
ENV N8N_SECURE_COOKIE=false
ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis

# Expose port
EXPOSE 5678

# Chạy n8n
CMD ["n8n"]
