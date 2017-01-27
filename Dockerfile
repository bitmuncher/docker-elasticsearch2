FROM centos:7
MAINTAINER Frank Fuhrmann <frank.fuhrmann@mailbox.org>

ENV PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin

# update system
RUN yum -y update

# create some directories we need
RUN mkdir /data

RUN mkdir /data/elasticsearch
RUN mkdir /data/elasticsearch/data
RUN mkdir /data/elasticsearch/logs

RUN yum -y install epel-release
RUN yum -y update

RUN yum -y install wget
	
# install java
RUN cd /usr/src && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm"
RUN cd /usr/src && yum -y localinstall jdk-8u121-linux-x64.rpm

# prepare package installation
RUN rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch

COPY conf/yum/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

RUN yum -y install elasticsearch

RUN chown -R elasticsearch:elasticsearch /data/elasticsearch
COPY conf/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN rm -rf /var/lib/elasticsearch
RUN ln -s /data/elasticsearch/data /var/lib/elasticsearch
RUN rm -rf /var/log/elasticsearch
RUN ln -s /data/elasticsearch/logs /var/log/elasticsearch

RUN usermod -s /bin/bash elasticsearch

CMD sh -c 'su elasticsearch -c "/usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -Ddefault.path.logs=/var/log/elasticsearch -Ddefault.path.data=/var/lib/elasticsearch -Ddefault.path.conf=/etc/elasticsearch"'