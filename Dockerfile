FROM n8nio/n8n:latest

# Cài đặt thư viện googleapis với root
USER root
RUN npm install -g googleapis

# Thiết lập biến môi trường
ENV N8N_DISABLE_SSL_VERIFY=true
ENV N8N_PROTOCOL=http
ENV N8N_PORT=5678

# Chạy với root thay vì user node
CMD ["n8n"]
