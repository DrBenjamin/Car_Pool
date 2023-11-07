# app/Dockerfile

FROM python:3.11

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    libmemcached11 \
    libmemcachedutil2 \
    build-essential \
    libmemcached-dev \
    libz-dev \
    libxml2-dev \
    zlib1g-dev \
    libicu-dev \
    g++ \
    pkg-config && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/DrBenjamin/Car_Pool.git .

RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade -r requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["python", "-m", "streamlit", "run", "Car_Pool.py", "--server.port=8501"]