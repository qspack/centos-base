ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=library
ARG FROM_IMG_NAME="centos"
ARG FROM_IMG_TAG="7.4.1708"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG SPACK_VER=0.11.2
LABEL org.spack.version=${SPACK_VER}
RUN yum update -y \
 && yum install -y wget automake curl gcc gcc-c++ gcc-gfortran libgfortran  make patch python libzip bzip2 gzip
RUN mkdir -p /usr/local/src/spack/ \
 && wget -qO - https://github.com/spack/spack/releases/download/v${SPACK_VER}/spack-${SPACK_VER}.tar.gz |tar xfz - -C /usr/local/src/spack/ --strip-component=1
ENV PATH=${PATH}:/usr/local/src/spack/bin/
