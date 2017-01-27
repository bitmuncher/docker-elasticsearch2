#!/bin/bash

su elasticsearch -c "/usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -Ddefault.path.logs=/var/log/elasticsearch -Ddefault.path.data=/var/lib/elasticsearch -Ddefault.path.conf=/etc/elasticsearch $EXTRA_OPTS $1"
