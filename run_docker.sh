#!/bin/bash

docker run \
    --rm \
    --name trello-cal-sync-container \
    -v trello-cal-sync-volume:"/app" \
    -v "$(pwd)":"/app/trello-cal-sync" \
    trello-cal-sync-image

