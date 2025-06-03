#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER?error}" <<-EOSQL
    CREATE USER ${APP_USER?error} WITH PASSWORD '${APP_USER_PWD?error}';
    ALTER USER ${APP_USER?error} CREATEDB;
EOSQL

psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER?error}" --dbname="${POSTGRES_DB?error}" <<-EOSQL
    GRANT CREATE ON SCHEMA public TO ${APP_USER?error};
    GRANT USAGE ON SCHEMA public TO ${APP_USER?error};
EOSQL
