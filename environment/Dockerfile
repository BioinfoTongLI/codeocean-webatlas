# hash:sha256:d11413c1ceed10f3ffcdc8336a6eea33b4f4b068f3642415a04d300ed46c61d2
FROM registry.codeocean.com/codeocean/miniconda3:4.12.0-python3.9-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20230311ubuntu0.20.04.1 \
        curl=7.68.0-1ubuntu2.19 \
        git=1:2.25.1-1ubuntu3.11 \
        gnupg=2.2.19-3ubuntu2.2 \
        openjdk-11-jre=11.0.20.1+1-0ubuntu1~20.04 \
        wget=1.20.3-1ubuntu2 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda \
        nextflow==23.04.3 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
