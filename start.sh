#!/bin/bash
set -e

export tenant="testlib"
export mod_login_version="mod-login-4.0.1-SNAPSHOT"
export mod_users_version="mod-users-14.3.0-SNAPSHOT"
export mod_permissions_version="mod-permissions-5.0.1-SNAPSHOT"
export mod_authtoken_version="mod-users-14.3.0-SNAPSHOT"


echo "start up okapi service"

exec java -jar \
 -Dstorage=postgres \
 -Dpostgres_host=postgres \
 /app/repo/okapi-core-fat.jar dev > okapi.log &

while ! echo exit | nc localhost 9130; do
	sleep 1;
done

echo "start deploy modules"

source /app/init.d/tenant/init-tenant.sh
source /app/init.d/modules/mod-login/deploy.sh
source /app/init.d/modules/mod-permissions/deploy.sh
source /app/init.d/modules/mod-users/deploy.sh

echo "finish deploy modules"

while true; do
	sleep 1000;
done
