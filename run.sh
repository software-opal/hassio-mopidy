#!/bin/bash
set -euxo pipefail

options=$(cat /data/options.json | jq -r 'if .options then [.options[] | "-o "+.name+"="+.value ] | join(" ") else "" end')
verbose=$(cat /data/options.json | jq -r '.verbose | (if .|not then "" elif . >= 1 then "-" + ([range(.)] | map("v") | join("")) else "-v" end)' )
config="/var/lib/mopidy/.config/mopidy/mopidy.conf"

mopidy $verbose --config $config $options
