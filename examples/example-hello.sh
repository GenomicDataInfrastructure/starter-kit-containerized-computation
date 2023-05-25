#!/bin/bash

curl --request POST \
	--url http://localhost:8010/v1/tasks \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--data '{"name": "Test world",
	"description": "Hello World, inspired by Funnel'\''s most basic example",
	"executors": [{
	"image": "alpine",
	"command": [
	"echo",
	"TESK says: Hello World"
	]
	}]
	}'
