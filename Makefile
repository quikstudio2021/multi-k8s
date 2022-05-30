VERSION := latest

build:
	docker build -t ymtangab/multi-client ./client
	docker build -t ymtangab/multi-nginx ./nginx
	docker build -t ymtangab/multi-server ./server
	docker build -t ymtangab/multi-worker ./worker

release:
	echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin
	docker push ymtangab/multi-client:latest
	docker push ymtangab/multi-nginx:latest
	docker push ymtangab/multi-server:latest
	docker push ymtangab/multi-worker:latest
