#!/bin/bash
set -e

echo "start up okapi service"

exec java -jar \
 -Dstorage=postgres \
 -Dpostgres_host=postgres \
 /app/repo/okapi-core-fat.jar dev > okapi.log &

while ! echo exit | nc localhost 9130; do
	echo "waiting okapi service";
	sleep 1;
done

echo "start deploy modules"

source /app/init.d/tenant/init-tenant.sh
source /app/init.d/modules/mod-login/deploy.sh

echo "finish deploy modules"

while true; do
	sleep 1000;
done
