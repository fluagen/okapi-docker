#!/bin/bash
set -e

exec java -jar \
 -Dstorage=postgres \
 -Dpostgres_host=postgres \
 /app/repo/okapi-core-fat.jar dev > okapi.log &
