# 1. Using an outdated, unsupported, and root user-based base image (security issue)
FROM ubuntu:16.04 

# 2. Running as root (security issue)
USER root

# 3. Installing packages without verification and leaving unnecessary dependencies (security issue)
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    netcat \
    python3 \
    && rm -rf /var/lib/apt/lists/*  
    # Removing apt cache doesn't fully prevent vulnerabilities

# Thiết lập thư mục làm việc
WORKDIR /app

# Tạo script entrypoint trực tiếp trong Dockerfile
RUN echo '#!/bin/bash\n\
echo "Hello from the container!"\n\
exec "$@"' > /app/entrypoint.sh

# Cấp quyền thực thi cho script
RUN chmod +x /app/entrypoint.sh

# 4. Exposing an insecure port (security issue)
EXPOSE 80

# 5. Hardcoding sensitive information in ENV variables (security issue)
ENV SECRET_KEY="my-secret-key"

# Thiết lập ENTRYPOINT và CMD hợp lý
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python3", "-m", "http.server", "80"]
