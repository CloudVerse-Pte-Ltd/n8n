FROM docker.n8n.io/n8nio/n8n

# Chạy với quyền root để cài đặt module
USER root
RUN npm install -g googleapis

# Tạo thư mục cấu hình và phân quyền
RUN mkdir -p /home/node/.n8n && chmod -R 777 /home/node/.n8n

# Thiết lập biến môi trường để bypass SSL
ENV N8N_DISABLE_SSL_VERIFY=true
ENV N8N_SECURE_COOKIE=false
ENV N8N_PROTOCOL=http
ENV N8N_PORT=5678
ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis
ENV N8N_EXTERNAL_MODULES_ALLOWLIST=*

# Chạy với user node để đảm bảo security
USER node
CMD ["n8n"]
