# Typesafe Activator Docker Image

*Java 8 and Activator 1.2.1 on Ubuntu 14.04*

This container serves as host for building out your own Scala, Play, and Akka containers for testing and deployment. It can also be used as is as a host for the Activator UI so that you can play around with the various examples that Typesafe ships.

To play with the Activator UI, you’ll first need fire up this container:

```
$ docker run -P duncan/activator:latest
Getting com.typesafe.activator activator-launcher 1.2.1 ...
```

Second, run either `docker ps` or `docker port CONTAINER 8888` to look up which port on your host machine you should connect to. Here’s an example on my machine:

```
$ docker port 04a0a09e0ba4 8888
0.0.0.0:49154
```

This means that when you point your browser on your host OS to http://0.0.0.0:49154, you’ll be hooked up to the Activator UI instance running in your container.

What? You’re on Mac OS X and need an environment to run this in? Here’s the quick version if you’re using HomeBrew and you already have VirtualBox installed:

```
$ brew install boot2docker
$ brew install docker
$ boot2docker init
$ boot2docker up
$ export DOCKER_HOST=tcp://localhost:4243
```
