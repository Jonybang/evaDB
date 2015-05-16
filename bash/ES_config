#!/bin/sh
curl -XPUT "localhost:9200/_river/mongodb/_meta" -d '{
  "type": "mongodb",
  "mongodb": {
    "servers": [
      { "host": "127.0.0.1", "port": 27017 }
    ],
    "options": { "secondary_read_preference": true },
    "db": "test",
    "collection": "contacts"
  },
  "index": {
    "name": "evaidx",
    "type": "contacts"
  }
}'
