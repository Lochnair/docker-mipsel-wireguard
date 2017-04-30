FROM lochnair/mipsel-musl-dev:latest

WORKDIR /root

ENV PATH="/opt/cross/bin:$PATH"

RUN \
git clone git://git.netfilter.org/libmnl && \
cd libmnl && \
./autogen.sh && \
CC="mipsel-linux-musl-gcc" ./configure --prefix="/opt/cross/mipsel-linux-musl" --enable-shared --enable-static --host=x86_64-linux-gnu && \
make -j$(nproc) && \
make install && \
cd .. && \
rm -rf libmnl
