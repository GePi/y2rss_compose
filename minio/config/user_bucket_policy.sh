#!/bin/sh

/usr/bin/mc alias set myminio http://minio:9000 ${MINIO_ROOT_USER} ${MINIO_ROOT_PASSWORD};
/usr/bin/mc admin user add myminio ${MINIO_Y2RSS_USER} ${MINIO_Y2RSS_PASSWORD};
/usr/bin/mc mb myminio/y2rssb0;
/usr/bin/mc admin policy create myminio y2rssb0_fullaccess /config/y2rssb0_bucket_fullaccess_policy.json;
/usr/bin/mc admin policy attach myminio  y2rssb0_fullaccess --user ${MINIO_Y2RSS_USER};
/usr/bin/mc anonymous set download myminio/y2rssb0;
