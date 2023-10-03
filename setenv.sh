#!/bin/sh
echo "Creating .env file ..."
tee -a .env <<END
RAILS_ENV=development
RAILS_MAX_THREADS=5
PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASS=postgres
DB_NAME=db_name
END

echo "Creating docker.env file ..."
tee -a docker.env <<END
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=db_name
END

echo "Done creating configs"
