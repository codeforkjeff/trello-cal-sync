#!/bin/bash

docker run \
    --rm \
    --name trello-cal-sync-container \
    -v "$(pwd)/service-account.json":"/app/service-account.json" \
    -v "$(pwd)/config.json":"/app/config.json" \
    trello-cal-sync-image
