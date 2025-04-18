#!/bin/bash
export ARCH=arm64
export KERNEL_ROOTDIR=`pwd`
export KERNEL_OUTDIR=${KERNEL_ROOTDIR}/out
target=alioth_lmperf_defconfig

function clean() {
cd ${KERNEL_ROOTDIR}
make mrproper
git restore drivers/*
}

make ${target} O=${KERNEL_OUTDIR}
make menuconfig O=${KERNEL_OUTDIR}
make savedefconfig O=${KERNEL_OUTDIR}
mv ${KERNEL_OUTDIR}/defconfig arch/${ARCH}/configs/${target}
clean
