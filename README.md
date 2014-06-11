#gitolite-docker
===============

Gitolite server on docker

## Build

1. Use your own ssh public key replace the content of `admin.pub`.

2. build it:
	```sh
	docker build -t yourname/gitolite .
	```

## Run

1. you should create a directory for git repositories.

	```sh
	$ sudo mkdir -p /opt/git
	$ sudo chown $USER:$USER /opt/git
	```
The path `/opt/git` have to match the folder name in `gitolite` script.

2. start it:

	```sh
	./gitolite start
	```

##More Detail
Please read this [article](http://betacz.com/2014/05/29/docker-gitolite/). It was written in Chinese.
