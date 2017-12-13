#!/bin/bash
set -e

exec java -Dport=8600 -Dstorage=postgres -Dpostgres_host=postgres -jar /app/repo/okapi-core-fat.jar initdatabase