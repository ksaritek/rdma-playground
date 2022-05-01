#!/bin/bash

### Install Soft RoCE

apt-get update

# The RDMA stack and SoftRoCE require the generic kernel (not virtual kernel)
apt-get install -y linux-generic
apt-get autoremove -y --purge linux-virtual

# rdma-core and utilities
apt-get install -y rdma-core build-essential ibverbs-utils perftest rdmacm-utils libibverbs1 librdmacm1 libibumad3 ibverbs-providers libibverbs-dev iproute2 net-tools git librdmacm-dev cmake libprotobuf-dev protobuf-compiler clang curl

#libibverbs-dev dependency
apt-get install -y pkg-config

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
chown -R vagrant:vagrant $HOME/.rustup
chown -R vagrant:vagrant $HOME/.cargo

# enable rxe
echo rdma_rxe > /etc/modules-load.d/rxe.conf
mv /tmp/rxe_all.sh /usr/bin/
chmod +x /usr/bin/rxe_all.sh
mv /tmp/rxe.service /etc/systemd/system/
chown root:root /usr/bin/rxe_all /etc/systemd/system/rxe.service
systemctl enable rxe.service
echo rdma_rxe > /etc/modules-load.d/rxe.conf

# sockperf - need to be pre-built or downloaded
apt-get install -y sockperf
