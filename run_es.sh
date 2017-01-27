#!/bin/bash

# make sure we have the correct privileges
chown elasticsearch:elasticsearch /data/elasticsearch/data
chown elasticsearch:elasticsearch /data/elasticsearch/logs

# run elasticsearch
su elasticsearch -c "/usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -Ddefault.path.logs=/var/log/elasticsearch -Ddefault.path.data=/var/lib/elasticsearch -Ddefault.path.conf=/etc/elasticsearch $1 $EXTRA_OPTS"
