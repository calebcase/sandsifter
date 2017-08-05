FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
      python \
      python-pip \
      libcapstone-dev \
    && \
    rm -fr /var/lib/apt/lists/*

RUN pip install 'capstone>=3.0,<4.0'

COPY . /src/github.com/xoreaxeaxeax/sandsifter
WORKDIR /src/github.com/xoreaxeaxeax/sandsifter

RUN make

ENTRYPOINT ["/usr/bin/python", "/src/github.com/xoreaxeaxeax/sandsifter/sifter.py"]
CMD ["--unk", "--dis", "--len", "--sync", "--tick", "--", "-P1", "-t"]
ENV TERM=xterm-256color
