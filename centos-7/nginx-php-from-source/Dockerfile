FROM centos:centos7
WORKDIR /workdir
ADD ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.43.tar.gz /workdir
RUN tar -zxf pcre-8.43.tar.gz \
 && cd pcre-8.43 \
 && ./configure \
 && make \
 && sudo make install


ADD http://zlib.net/zlib-1.2.11.tar.gz /workdir
RUN tar -zxf zlib-1.2.11.tar.gz \
 && cd zlib-1.2.11 \
 && ./configure \
 && make \
 && sudo make install