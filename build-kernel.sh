#!/bin/bash
set -e

echo "Cloning kernel and pulling latest..."
git clone --depth 1 --branch v6.2  https://github.com/torvalds/linux.git /workspace/kernel 2> /dev/null || (cd /workspace/kernel ; git pull)

cd /workspace/kernel

echo "Copying config"
cp /workspace/.config ./
cat .config

echo "Building kernel: make vmlinux"
make vmlinux
cp ./vmlinux /output
