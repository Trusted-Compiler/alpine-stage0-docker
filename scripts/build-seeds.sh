#!/bin/sh

set -ex

source /arch/env
cd ${BUILDER_PREFIX}

## Build hex0

echo "src 0 /dev" > hex0.src
cp "${SEEDS_PREFIX}/POSIX/${ARCH}/hex0_${ARCH}.hex0" ./hex0.hex0
./hex0-to-src.sh ./hex0.hex0 >> hex0.src

ENABLE_KVM= ./build-stages.sh \
  ${SEEDS_PREFIX}/NATIVE/x86/builder-hex0-x86-stage1.img \
  ./builder-hex0-x86-stage2.hex0 \
  hex0.src \
  hex0-seed

chmod 755 ./hex0-seed

## kaem.src

echo "src 0 /dev" > kaem.src
cp "${SEEDS_PREFIX}/POSIX/${ARCH}/kaem-minimal.hex0" .
./hex0-to-src.sh ./kaem-minimal.hex0 >> kaem.src

ENABLE_KVM= ./build-stages.sh \
  ${SEEDS_PREFIX}/NATIVE/x86/builder-hex0-x86-stage1.img \
  ./builder-hex0-x86-stage2.hex0 \
  kaem.src \
  kaem-optional-seed

chmod 755 ./kaem-optional-seed

