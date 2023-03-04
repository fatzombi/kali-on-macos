USERNAME=default_username
CONTAINER_NAME=default_container

export USERNAME := $(shell cat .env | grep USERNAME | cut -d '=' -f2)
export CONTAINER_NAME := $(shell cat .env | grep CONTAINER_NAME | cut -d '=' -f2)

run:
# We should add some conditions here so we don't sleep when we don't need to.
	open -g /Applications/Utilities/Xquartz.app 
	sleep 2
	DISPLAY=:0 /opt/X11/bin/xhost + || TRUE
	sleep 2
	docker start ${CONTAINER_NAME}
	docker exec --user ${USERNAME} --workdir /home/${USERNAME}/ -it ${CONTAINER_NAME} /bin/zsh
