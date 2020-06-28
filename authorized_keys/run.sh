#!/bin/bash
set -euxo pipefail

cat /data/options.json | jq .

cat /authorized_keys

( cat /authorized_keys && ( cat /data/options.json | jq -r '.keys|join("\n")' ) ) | sort -u > /temp
cat /temp > /authorized_keys 
