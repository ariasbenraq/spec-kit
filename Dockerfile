FROM python:3.12-slim-bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl ca-certificates build-essential libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar uv (gestor de paquetes recomendado por Spec Kit)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /workspace

# Instalar specify-cli desde PyPI (forma oficial y estable)
RUN uv tool install specify-cli
ENV PATH="/root/.local/share/uv/tools/specify-cli/bin:${PATH}"

# Volumen para proyectos persistentes
VOLUME ["/workspace/projects"]

CMD ["/bin/bash"]
