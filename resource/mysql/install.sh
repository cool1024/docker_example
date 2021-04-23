#!/bin/bash
#################
# INSTALL MYSQL 8.0.22
# SOURCE CODE URL : https://downloads.mysql.com/archives/get/p/23/file/mysql-8.0.22.tar.gz
#################

WORK_PATH=/var/mysql
WORK_RESOURCE=/var/mysql/resource

BOOST_DOWNLOAD_URL=https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz
MYSQL_DOWNLOAD_URL=https://downloads.mysql.com/archives/get/p/23/file/mysql-8.0.22.tar.gz
SOURCE_FILE=$WORK_RESOURCE/mysql-8.0.22.tar.gz
BOOST_FILE=$WORK_RESOURCE/boost_1_73_0.tar.gz
BOOST_DIR=$WORK_RESOURCE/boost_1_73_0
OPENSSL_DIR=$WORK_RESOURCE/openssl-1.1.1g
MYSQL_DIR=$WORK_RESOURCE/mysql-8.0.22
RPCSV_DIR=$WORK_RESOURCE/rpcsvc-proto-1.4.2

function download_source() {
    DOWNLOAD_URL=$1
    TARGET_FILE=$2
    if [[ ! -f "$TARGET_FILE" ]]; then
        echo "download=>$DOWNLOAD_URL"
        wget $DOWNLOAD_URL
    fi
}

function prepare_env() {
    yum -y install make gcc-c++ bison cmake openssl-devel ncurses-devel libtirpc-devel
}

function prepare_source() {
    yum install -y wget
    download_source $BOOST_DOWNLOAD_URL $BOOST_FILE
    tar -xzvf $BOOST_FILE
    # mv $BOOST_DIR /usr/local/boost
    # ln -s $BOOST_DIR /usr/local/boost
    download_source $MYSQL_DOWNLOAD_URL $SOURCE_FILE
    tar -xzvf $SOURCE_FILE
}

function install_rpcsv() {
    cd $RPCSV_DIR
    ./configure
    make
    make install
}

function compile_source() {
    cd $MYSQL_DIR
    rm -rf bld
    mkdir bld
    cd bld
    cmake .. -DCMAKE_INSTALL_PREFIX=/var/mysql/mysql \
        -DDEFAULT_CHARSET=utf8 \
        -DDEFAULT_COLLATION=utf8_general_ci \
        -DENABLED_LOCAL_INFILE=ON \
        -DWITH_INNODB_MEMCACHED=ON \
        -DWITH_SSL=system \
        -DWITH_INNOBASE_STORAGE_ENGINE=1 \
        -DWITH_FEDERATED_STORAGE_ENGINE=1 \
        -DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
        -DWITH_ARCHIVE_STORAGE_ENGINE=1 \
        -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1 \
        -DWITH_PERFSCHEMA_STORAGE_ENGINE=1 \
        -DCOMPILATION_COMMENT="zsd edition" \
        -DWITH_BOOST=$BOOST_DIR \
        -DMYSQL_UNIX_ADDR=/var/mysql/mysql.sock \
        -DSYSCONFDIR=/var/mysql/mysql/etc
    make && make install
}

function init_mysql() {
    # create mysql user
    sudo groupadd mysql
    sudo useradd -r -g mysql -s /bin/false mysql

    cd /var/mysql/mysql
    # will print random password (look like=>Nd:4hu3kuJ>)
    mysqld --initialize-insecure --user=mysql
    mysql_ssl_rsa_setup
    # /var/mysql/mysql/bin/mysqld_safe --user=mysql &
    sudo chown mysql:mysql /var/mysql/mysql/data
    sudo chmod 750 /var/mysql/mysql/data

    # CREATE USER 'app'@'%' IDENTIFIED BY 'app';
}

# prepare_source
# install_rpcsv
# compile_source
# groupadd mysql
# useradd -r -g mysql -s /bin/false mysql
export PATH=$PATH:/var/mysql/mysql/bin
mysqld_safe --user=mysql &