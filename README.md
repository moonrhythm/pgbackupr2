# pgbackupr2

pg_dump | gzip | rclone > r2

## Example

```bash
$ docker run --rm \
    -e ACCESS_KEY_ID=xxx \
    -e SECRET_ACCESS_KEY=xxx \
    -e ACCOUNT=xxx \
    -e BUCKET=backup \
    -e PGDATABASE=my_db \
    -e PGHOST=192.168.0.9 \
    -e PGPORT=5432 \
    -e PGUSER=postgres \
    -e PGPASSWORD=my_password \
    gcr.io/moonrhythm-containers/pgbackupr2
```
