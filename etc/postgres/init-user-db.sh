#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE fastpay;
	CREATE DATABASE ordering;
	CREATE DATABASE billing;
	CREATE DATABASE authorization_server;
	CREATE DATABASE ordering_test;
	CREATE DATABASE billing_test;
	CREATE DATABASE authorization_server_test;
EOSQL