#!/bin/sh

set -ex

source /arch/env
mkdir -p ${STAGE0_PREFIX}
cd ${STAGE0_PREFIX}

## copy locally built seeds

mkdir -p ./bootstrap-seeds/POSIX/${ARCH}/
cp ${BUILDER_PREFIX}/kaem-optional-seed ./bootstrap-seeds/POSIX/${ARCH}/
cp ${BUILDER_PREFIX}/hex0-seed ./bootstrap-seeds/POSIX/${ARCH}/

## copy dependencies

cp -r /external/stage0-posix/${ARCH} ./${ARCH}

cp -r /external/stage0-posix/M2-Planet ./M2-Planet
cp -r /external/stage0-posix/M2-Mesoplanet ./M2-Mesoplanet
cp -r /external/stage0-posix/mescc-tools ./mescc-tools
cp -r /external/stage0-posix/mescc-tools-extra ./mescc-tools-extra
cp -r /external/stage0-posix/M2libc ./M2libc
cp /external/stage0-posix/kaem.* ./
cp /external/stage0-posix/*.answers ./
cp /external/stage0-posix/after.kaem ./

./bootstrap-seeds/POSIX/${ARCH}/kaem-optional-seed

echo "export PATH=${STAGE0_BIN}:${PATH}" >> ~/.profile
