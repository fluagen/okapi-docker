#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

curl -X POST -s \
     -H "Content-type:application/type" \
     -d @$DIR/data.json \
     -o /dev/null \
     http://localhost:9130/_/proxy/tenants