#!make
#include .env
#export $(shell sed 's/=.*//' .env)


docker-tag=zzave/docker-puppeteer:latest
docker-name=docker-puppeteer

build:
	docker build -t ${docker-tag} .
.PHONY: build

run:
	docker run --rm -i \
			--name ${docker-name} \
			${docker-tag}
.PHONY: run

stop:
	docker stop ${docker-name}
.PHONY: stop

destroy:
	docker rmi ${docker-tag}
.PHONY: destroy

logs:
	docker logs -f ${docker-name}
.PHONY: log