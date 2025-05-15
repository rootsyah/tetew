FROM ubuntu:22.04

# Update dan install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    curl \
    wget \
    build-essential

# Install Ethereum client (geth)
RUN add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum

# Buat direktori untuk data blockchain
RUN mkdir -p /root/.ethereum

# Expose port yang diperlukan
EXPOSE 8545 8546 30303 30303/udp

# Command untuk menjalankan Sepolia node
CMD ["geth", "--sepolia", "--http", "--http.addr=0.0.0.0", "--http.api=eth,net,web3"]
