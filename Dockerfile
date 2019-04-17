ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=library
ARG FROM_IMG_NAME="centos"
ARG FROM_IMG_TAG="7.6.1810"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG SPACK_COMMIT_TAG=2be65a86189d63f8742f3065a385a904c429e45b
ARG SPACK_GH_URL=https://github.com/
ARG SPACK_GH_USER=spack
LABEL org.spack.tag=${SPACK_COMMIT_TAG}
RUN yum update -y \
 && yum install -y wget automake curl gcc gcc-c++ gcc-gfortran libgfortran  make patch python libzip bzip2 gzip unzip which
RUN mkdir -p /opt/spack/ \
 && wget -qO - https://github.com/spack/spack/archive/v0.12.1.tar.gz |tar xfz - -C /opt/spack/ --strip-component=1
ENV PATH=${PATH}:/opt/spack/bin/
