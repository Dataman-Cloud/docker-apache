#!/bin/bash
base_dir=$(cd `dirname $0` && pwd)
cd $base_dir

set -e

version=2.4.6

rm -rf httpd-$version
if [ ! -f httpd-$version-17.el7.centos.1.src.rpm ];then
    wget ftp://bo.mirror.garr.it/1/slc/centos/7.0.1406/os/Sources/Packages/httpd-$version-17.el7.centos.1.src.rpm
fi
mkdir httpd-$version
cd httpd-$version
rpm2cpio ../httpd-$version-17.el7.centos.1.src.rpm | cpio -div
cd ..
\cp -f httpd.spec httpd-$version/

#docker run --rm -e VERBOSE="-x" -v $base_dir/httpd-$version:/src --workdir=/src --entrypoint="./configure" demoregistry.dataman-inc.com/library/centos7-rpmbuild --prefix=/usr/local/apache --with-apr=/usr --with-apr-util=/usr --with-pcre --with-ssl --enable-so --enable-ssl --enable-mods-shared=all --enable-cache --enable-disk-cache --enable-file-cache --enable-mem-cache
docker run --rm -e VERBOSE="-x" -v $base_dir/httpd-$version:/src --workdir=/src demoregistry.dataman-inc.com/library/centos7-rpmbuild httpd.spec

mkdir -p  rpms/httpd 
cp httpd-$version/RPMS/x86_64/*.rpm rpms/httpd/
rm -rf httpd-$version httpd-$version-17.el7.centos.1.src.rpm
