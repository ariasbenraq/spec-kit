FROM node:22-bookworm

RUN apt-get update && \
    apt-get install -y git && \
    npm install -g @github/spec-kit

WORKDIR /workspace

CMD ["tail", "-f", "/dev/null"]
