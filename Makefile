all: build

Docker/loader: loader
	cp loader Docker/loader

build: Docker/loader
	docker build -t logging-load-driver Docker
