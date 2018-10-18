#!/bin/bash

APP="netdata"

docker ps -q -f name=$APP > /tmp/checkapp.txt
clear

if [ -s /tmp/checkapp.txt ]; then

	ALREADYINSTALLED

else

	EXPLAINAPP

	CONFIRMATION

	if [[ ${REPLY} =~ ^[Yy]$ ]]; then

		GOAHEAD

		cd $CONFIGS/Docker
		sudo rsync -a /opt/GooPlex/scripts/components/02-netdata* $CONFIGS/Docker/components
		/usr/local/bin/docker-compose down
		source /opt/GooPlex/install/misc/environment-build.sh.sh rebuild
		/usr/local/bin/docker-compose up -d --remove-orphans ${@:2}
		cd "${CURDIR}"

		APPINSTALLED

		TASKCOMPLETE

	else

		CANCELTHIS

	fi

fi

rm /tmp/checkapp.txt
PAUSE
