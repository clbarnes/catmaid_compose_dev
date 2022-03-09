#!/bin/sh
for SERVICE in db broker; do
	echo "$SERVICE: $(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${HOSTNAME_PREFIX}$SERVICE)"
done
