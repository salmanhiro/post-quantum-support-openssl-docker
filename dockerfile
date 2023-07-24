FROM python:3.9-alpine3.13 AS build

RUN apk --update  add \
    postgresql-dev \
    postgresql-client \
    git cmake g++ libffi-dev make ninja musl-dev python3-dev cargo perl openssl-dev

WORKDIR /home/apps

RUN git clone https://github.com/open-quantum-safe/openssl.git && \
    cd openssl && \
    git checkout 1e13c8cb261089fe49120e23b91fc666d562f45b && \
    cd ../ && \
    git clone https://github.com/open-quantum-safe/liboqs.git && \
    cd liboqs && \
    git checkout d5be452ec8824775da55f16bcb14e54e61ce9ff6 && \
    cd ..

RUN cd liboqs && \
    mkdir build && \
    cd build && \
    cmake -GNinja -DCMAKE_INSTALL_PREFIX=../../openssl/oqs .. && \
    ninja && \
    ninja install && \
    cd ../../

RUN cd openssl && \
    ./Configure no-shared linux-x86_64 -lm && \
    make && \
    make install && \
    cd ../

COPY generate_file.sh /home/apps/generate_file.sh

RUN chmod +x /home/apps/generate_file.sh

ENTRYPOINT ["/home/apps/generate_file.sh"]
