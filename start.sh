#!/bin/bash
set -e

export tenant="testlib"
export mod_login_version="mod-login-4.0.1-SNAPSHOT"
export mod_users_version="mod-users-14.3.0-SNAPSHOT"
export mod_permissions_version="mod-permissions-5.0.1-SNAPSHOT"
export mod_authtoken_version="mod-authtoken-1.1.1-SNAPSHOT"

sleep 3
echo "start up okapi service"

postgres_db_init=0

if [[ "initdatabase" == $1 ]]; then
	postgres_db_init=1
fi


exec java -jar \
 -Dstorage=postgres \
 -Dpostgres_host=postgres \
 -Dpostgres_db_init=$postgres_db_init \
 /app/repo/okapi-core-fat.jar dev > okapi.log &

while ! echo exit | nc localhost 9130; do
	sleep 1;
done

echo "start deploy modules"

source /app/init.d/tenant/init-tenant.sh
source /app/init.d/modules/mod-login/deploy.sh
source /app/init.d/modules/mod-permissions/deploy.sh
source /app/init.d/modules/mod-users/deploy.sh
source /app/init.d/modules/mod-authtoken/deploy.sh

echo "finish deploy modules"

while true; do
	sleep 1000;
done
