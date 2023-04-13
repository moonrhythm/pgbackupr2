#!/bin/bash

if [[ -z "${ACCESS_KEY_ID}" ]]; then
    echo "ACCESS_KEY_ID is not set"
    exit 1
fi

if [[ -z "${SECRET_ACCESS_KEY}" ]]; then
    echo "SECRET_ACCESS_KEY is not set"
    exit 1
fi

if [[ -z "${ACCOUNT}" ]]; then
    echo "ACCOUNT is not set"
    exit 1
fi

if [[ -z "${BUCKET}" ]]; then
    echo "BUCKET is not set"
    exit 1
fi

mkdir -p /root/.config/rclone
cat << EOF > /root/.config/rclone/rclone.conf
[r2]
type = s3
provider = Cloudflare
access_key_id = $ACCESS_KEY_ID
secret_access_key = $SECRET_ACCESS_KEY
endpoint = https://$ACCOUNT.r2.cloudflarestorage.com
acl = private
EOF

if [[ -z "${PGDATABASE}" ]]; then
  pg_dumpall | gzip | rclone rcat r2://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.sql.gz
else
  pg_dump | gzip | rclone rcat r2://$BUCKET/$PREFIX$(date +"%Y%m%d%H%M%S")$SUFFIX.sql.gz
fi
