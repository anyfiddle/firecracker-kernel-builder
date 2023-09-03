# Firecracker Kernel builder

Container to build custom kernel drives for booting Firecracker microVMs.

### Build Firecracker kernel using custom config

Mount `.config` file for kernel customisation into `/workspace/.config` inside the container and run

Build builder docker image
```sh
docker build -t anyfiddle/firecracker-rootfs-builder .
```

```sh
docker run \
    -v $(pwd)/output:/output \
    -v $(pwd)/kernel:/workspace/kernel \
    -v $(pwd)/.config:/workspace/.config \
    anyfiddle/firecracker-rootfs-builder
```

The `vmlinux.bin` will be created in `./output` folder which can be used as the kernel for starting Firecracker VMs
