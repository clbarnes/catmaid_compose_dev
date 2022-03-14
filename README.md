# catmaid_compose_dev

A docker-compose configuration for the services CATMAID requires, but not CATMAID itself.

## Usage

```sh
cp .env.example .env
# modify .env to change postgres credentials, volume location etc.
docker-compose up
```

Note that in most cases, changes to `.env` will necessitate
stopping and removing containers (`docker-compose down`)
and deleting volumes (`sudo rm -rf "$VOLUME_PREFIX"`).

Connect to the database with `psql -h <db container ip> $POSTGRES_DB -U $POSTGRES_USER` (or use `pgcli`, it's much better).
See rabbitmq's management page by navigating to `http://<broker container ip>:15672` (note HTTP).

### Database dumps

Dump the postgres cluster with `pg_dumpall -h <db container ip> $POSTGRES_DB -U $POSTGRES_USER | gzip -c > dump.sql.gz`.
Restore it with `zcat dump.sql.gz | psql -h <db container ip> $POSTGRESDB -U $POSTGRES_USER`.
Note that this might flatten whatever database you have currently.
You will need to use the same database name and credentials as the original.

## Utilities

`get_ips.sh` prints the local IPs of each service.
