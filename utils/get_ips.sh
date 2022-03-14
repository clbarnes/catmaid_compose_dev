#!/bin/sh
for SERVICE in db broker; do
	echo "export ${HOSTNAME_PREFIX}${SERVICE}_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${HOSTNAME_PREFIX}$SERVICE)"
done
