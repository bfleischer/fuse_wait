#!/bin/sh -x

# These variables are always passed to build.sh
DIST_DIR="$1"
TMP_DIR="$2"
ROOT_DIR="$3"

PROJNAME="fuse_wait"

DESTDIR="usr/local/bin"

CC="`xcrun -find clang`"

OSX_TARGET=10.10
SDK="`xcodebuild -version -sdk macosx10.10 Path`"
TARGET_FLAGS="-arch i386 ${OSX_TARGET:+-mmacosx-version-min=${OSX_TARGET}}"
COMPILE_FLAGS="${TARGET_FLAGS} ${SDK:+-isysroot ${SDK}} -Wl,-syslibroot,${SDK}} -g -Wall -fconstant-cfstrings -framework CoreFoundation"

"${CC}" ${COMPILE_FLAGS} -o "${TMP_DIR}/${PROJNAME}" "${DIST_DIR}/${PROJNAME}.c" && \
    sudo cp "${TMP_DIR}/${PROJNAME}" "${ROOT_DIR}/${DESTDIR}" && \
    sudo chmod 755 "${ROOT_DIR}/${DESTDIR}/${PROJNAME}" && \
    sudo chown root:wheel "${ROOT_DIR}/${DESTDIR}/${PROJNAME}"

exit $?
