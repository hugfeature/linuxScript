#!/bin/bash
#########################################################
#É¨ÃèÖ÷»ú¶Ë¿ÚºÅ
########################################################
HOST=$1
PORT="22 25 80 8080"
for PORT in $PORT; do
    if echo &>/dev/null > /dev/tcp/$HOST/$PORT; then
        echo "$PORT open"
    else
        echo "$PORT close"
    fi
done