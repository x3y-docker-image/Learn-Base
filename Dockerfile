FROM ubuntu:bionic

MAINTAINER x3y changhongbo@gmail.com

ENV LLVM_VERSION=8

ADD my.sources.list

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
 && apt-get install -y \
  libllvm-7-ocaml-dev libllvm7 llvm-7 llvm-7-dev llvm-7-doc llvm-7-examples llvm-7-runtime \
 # Clang and co
 && apt-get install -y \
  clang-7 clang-tools-7 clang-7-doc libclang-common-7-dev libclang-7-dev libclang1-7 clang-format-7 python-clang-7 \
 # libfuzzer
 && apt-get install -y libfuzzer-7-dev \
 # lldb
 && apt-get install -y lldb-7 \
 # lld (linker)
 && apt-get install -y lld-7 \
 # libc++
 && apt-get install -y libc++-7-dev libc++abi-7-dev \
 # OpenMP
 && apt-get install -y libomp-7-dev
