#!/bin/bash

#tenant="testlib"

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9130/_/proxy/tenants/$tenant)

if test $http_code -eq 200;then
    echo "The tenant $tenant has been register";
else
    echo "The tenant $tenant start register";
    curl -X POST -s \
	     -H "Content-type:application/json" \
	     -d @$DIR/data.json \
	     -o /dev/null \
	     http://localhost:9130/_/proxy/tenants
fi
