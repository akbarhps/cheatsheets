#!/bin/sh
# alpine image only run shell

# return immediately when command return
# non-zero status
set -e

echo "run db migration"
source /app/app.env
/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

echo "start the app"
# takes all parameter passed to this script
# and run it
exec "$@"
