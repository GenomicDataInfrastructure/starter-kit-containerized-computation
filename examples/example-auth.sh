#!/bin/bash

curl --request POST \
	--url http://localhost:8010/v1/tasks \
	--header 'Accept: application/json' \
	--header 'Authorization: Bearer eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyN' \
	--header 'Content-Type: application/json' \
	--data '{
  "description": "Demonstrates handling single http file input. Will output some nice looking JSON to stdout.",
  "inputs": [
    {
      "url": "htsget://bearer:eyJqa3UiOiJodHRwczovL29pZGM6ODA4MC9qd2siLCJraWQiOiJFQzEiLCJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyZXF1ZXN0ZXJAZGVtby5vcmciLCJhdWQiOlsiYXVkMSIsImF1ZDIiXSwiYXpwIjoiYXpwIiwic2NvcGUiOiJvcGVuaWQgZ2E0Z2hfcGFzc3BvcnRfdjEiLCJpc3MiOiJodHRwczovL29pZGM6ODA4MC8iLCJleHAiOjk5OTk5OTk5OTksImlhdCI6MTU2MTYyMTkxMywianRpIjoiNmFkN2FhNDItM2U5Yy00ODMzLWJkMTYtNzY1Y2I4MGMyMTAyIn0.vpWUe8UT3KJ3Eyr_CcVshbFiFACLuBG5YTlzxOxvlGR7QMWd17DW6f01VFHb1H3RdV9nPu_3CmqqPnIRp5YaHA@dockerhost:3000/reads/s3/EGAD74900000101/dummy_gdi.eu/NA12878.bam",
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
