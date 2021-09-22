all: loader-image

loader-image: loader
	buildah bud -f Dockerfile -t loader:latest

loader: ../loader
	cp -a ../loader ./loader

nasty-image: nasty
	buildah bud -f Dockerfile.nasty -t nasty:latest

nasty: nasty.c
	cc -o nasty nasty.c

clean:
	rm -f nasty loader
