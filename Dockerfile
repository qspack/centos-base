ARG DOCKER_REGISTRY=docker.io
FROM ${DOCKER_REGISTRY}/qnib/cplain-init

ARG SPACK_VER=0.11.2
LABEL org.spack.version=${SPACK_VER}
RUN yum update -y \
 && yum install -y wget automake curl gcc gcc-c++ gcc-gfortran libgfortran  make patch python libzip bzip2 gzip
RUN mkdir -p /usr/local/src/spack/ \
 && wget -qO - https://github.com/spack/spack/releases/download/v${SPACK_VER}/spack-${SPACK_VER}.tar.gz |tar xfz - -C /usr/local/src/spack/ --strip-component=1
ENV PATH=${PATH}:/usr/local/src/spack/bin/
