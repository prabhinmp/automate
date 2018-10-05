#!/bin/bash
set -e
echo "Install NGINX in Centos using Source Code"

#Install dependecies
sudo yum install -y  gcc cpp c++ geoip libgeoip-dev geoip-devel GeoIP-data gcc-c++ wget autoconf automake
mkdir /opt/nginx-compile;cd /opt/nginx-compile
#install PCRE
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.41.tar.gz
tar -xvzf pcre-8.41.tar.gz
cd pcre-8.41
./configure
make
make install
cd ..

#Insall zlib
wget http://zlib.net/fossils/zlib-1.2.10.tar.gz
tar -xvzf zlib-1.2.10.tar.gz
cd zlib-1.2.10
./configure
make
make install
cd ..

#install Openssl
wget https://www.openssl.org/source/openssl-1.0.2n.tar.gz
tar -xvzf openssl-1.0.2n.tar.gz
cd openssl-1.0.2n
./Configure linux-x86_64 --prefix=/usr
make
make install
cd ..

#install
sudo yum -y install libpcap libpcap-devel libnet libnet-devel pcre pcre-devel gcc gcc-c++ automake autoconf libtool make libyaml libyaml-devel zlib zlib-devel file-devel
yum -y install GeoIP-devel GeoIP

mkdir /opt/nginx/


#install nginx
wget http://nginx.org/download/nginx-1.13.6.tar.gz
tar -xvzf nginx-1.13.6.tar.gz
cd nginx-1.13.6
./configure --prefix=/opt/nginx --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-http_geoip_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_slice_module --with-openssl=/opt/nginx-compile/openssl-1.0.2n --with-pcre=/opt/nginx-compile/pcre-8.41 --with-http_stub_status_module --with-threads --with-stream --with-stream_ssl_module --with-file-aio --with-zlib=/opt/nginx-compile/zlib-1.2.10
make
make install
