#gitolite-docker
===============

Gitolite server on docker

## Build

```sh
docker build -t yourname/gitolite .
```

## Run

First, you should create a directory for git repositories.

```sh
$ sudo mkdir -p /opt/git
$ sudo chown $USER:$USER /opt/git
```
The path `/opt/git` have to match the folder name in `gitolite` script.

Then, you can run it.

```sh
./gitolite start
```

##More Detail
Please read this [article](http://betacz.com/2014/05/29/docker-gitolite/). It was written in Chinese.
