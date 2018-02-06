all: Docker/loader build

Docker/loader: loader
	cp loader Docker/loader

build:
	docker build -t logging-load-driver Docker
