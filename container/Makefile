all: image

image: loader
	buildah bud -f Dockerfile -t loader:latest

loader: ../loader
	cp -a ../loader ./loader
