#!/bin/bash
set -e

exec java -jar \
 -Dstorage=postgres \
 -Dpostgres_host=postgres \
 -Dpostgres_db_init=0 \
 /app/repo/okapi-core-fat.jar cluster