#!/bin/bash
# LICENSE CDDL 1.0 + GPL 2.0
#
# Copyright (c) 1982-2016 Oracle and/or its affiliates. All rights reserved.
#
# Since: December, 2016
# Author: gerald.venzl@oracle.com
# Description: Sets up the unix environment for DB installation.
# 
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
# 

# Setup filesystem and oracle user
# Adjust file permissions, go to /opt/oracle as user 'oracle' to proceed with Oracle installation
# ------------------------------------------------------------
mkdir -p $ORACLE_BASE/scripts/setup && \
mkdir $ORACLE_BASE/scripts/startup && \
ln -s $ORACLE_BASE/scripts /docker-entrypoint-initdb.d && \
mkdir $ORACLE_BASE/oradata && \
chmod ug+x $ORACLE_BASE/*.sh && \
yum -y install wget && \
cd /etc/yum.repos.d && \
echo "ADDDDDD REPOSITORUUUUU" && \
wget http://public-yum.oracle.com/public-yum-ol7.repo && \
wget http://public-yum.oracle.com/RPM-GPG-KEY-oracle-ol7 -O /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle && \
echo "ADDDDDD KEY" && \
yum update -y && \
yum -y install oracle-rdbms-server-12cR1-preinstall unzip tar openssl && \
echo "INSTALL DB" && \
yum clean all && \
echo oracle:oracle | chpasswd && \
chown -R oracle:dba $ORACLE_BASE
