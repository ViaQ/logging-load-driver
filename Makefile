all: container/loader
	buildah bud -t loader-container container/

push:
	buildah push loader-container:latest docker://quay.io/portante/loader-container:latest

container/loader: loader
	cp -a loader container/

clean:
	rm container/loader
