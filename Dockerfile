FROM r-base:latest

RUN apt-get update && apt-get install -y libxml2-dev \
&& apt-get install -y libcurl4-openssl-dev && apt-get install -y libssl-dev && apt install -y imagemagick && apt -y install procps 

COPY ./cmd /usr/local/cmd

COPY ./sampledata /sampledata

ENV PATH /usr/local/cmd:$PATH

RUN Rscript /usr/local/cmd/BiocManager.r

