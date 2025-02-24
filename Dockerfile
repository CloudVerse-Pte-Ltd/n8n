# Sử dụng n8n chính thức
FROM n8nio/n8n:latest

# Cài đặt thư viện Google APIs (nếu cần)
RUN npm install googleapis

# Đặt biến môi trường
ENV N8N_SECURE_COOKIE=false
ENV NODE_FUNCTION_ALLOW_EXTERNAL=googleapis

# Expose port
EXPOSE 5678

# Chạy n8n
CMD ["n8n"]
