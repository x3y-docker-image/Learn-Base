FROM ubuntu:bionic

MAINTAINER x3y changhongbo@gmail.com

ENV LLVM_VERSION=8

ADD my.sources.list  /

# Pre-Req Repos
RUN apt-get update \
 && apt-get install -y software-properties-common \
            gnupg \
            wget \
 # Install pre-reqs
 && mv my.sources.list /etc/apt/sources.list.d/ \
 && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -  \
 && apt-get update \
 && apt-get install -y ca-certificates build-essential \
 # LLVM
 libllvm-$LLVM_VERSION-ocaml-dev libllvm$LLVM_VERSION llvm-$LLVM_VERSION llvm-$LLVM_VERSION-dev llvm-$LLVM_VERSION-doc llvm-$LLVM_VERSION-examples llvm-$LLVM_VERSION-runtime \
 # Clang and co
 clang-$LLVM_VERSION clang-tools-$LLVM_VERSION clang-$LLVM_VERSION-doc libclang-common-$LLVM_VERSION-dev libclang-$LLVM_VERSION-dev libclang1-$LLVM_VERSION clang-format-$LLVM_VERSION python-clang-$LLVM_VERSION \
 # libfuzzer
 libfuzzer-$LLVM_VERSION-dev \
 # lldb
 lldb-$LLVM_VERSION \
 # lld (linker)
 lld-$LLVM_VERSION \
 # libc++
 libc++-$LLVM_VERSION-dev libc++abi-$LLVM_VERSION-dev \
 # OpenMP
 libomp-$LLVM_VERSION-dev \
 && rm -rf /var/lib/apt/lists/*
