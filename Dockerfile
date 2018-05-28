ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=library
ARG FROM_IMG_NAME="centos"
ARG FROM_IMG_TAG="7.4.1708"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG SPACK_COMMIT_TAG=2be65a86189d63f8742f3065a385a904c429e45b
ARG SPACK_GH_URL=https://github.com/
ARG SPACK_GH_USER=spack
LABEL org.spack.tag=${SPACK_COMMIT_TAG}
RUN yum update -y \
 && yum install -y wget automake curl gcc gcc-c++ gcc-gfortran libgfortran  make patch python libzip bzip2 gzip unzip
RUN mkdir -p /opt/spack/ \
 && cd /opt/ \
 && wget -q ${SPACK_GH_URL}/${SPACK_GH_USER}/spack/archive/${SPACK_COMMIT_TAG}.zip \
 && unzip ${SPACK_COMMIT_TAG}.zip \
 && mv spack-2be65a86189d63f8742f3065a385a904c429e45b/* /opt/spack \
 && rm -rf spack-missing-compiler-import \
 && rm -f ${SPACK_COMMIT_TAG}.zip
ENV PATH=${PATH}:/opt/spack/bin/
