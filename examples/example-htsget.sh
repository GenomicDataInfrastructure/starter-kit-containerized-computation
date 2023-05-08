#!/bin/bash

curl --request POST \
	--url http://localhost:8000/v1/tasks \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--data '{
  "description": "Demonstrates handling single http file input. Will output some nice looking JSON to stdout.",
  "inputs": [
    {
      "url": "htsget://{YOUR_HOSTNAME_HERE}:3000/reads/s3/NA12878.bam",
      "path": "/tes/volumes/input",
      "type": "FILE"
    }
  ],
  "executors": [
    {
      "image": "alpine",
      "command": [
        "md5sum",
        "/tes/volumes/input"
      ]
    }
  ]
}'
