# rpi-proftpd

A docker image of proftpd for RaspberryPi, based on resin/rpi-raspbian:stretch

## Users

You can provide your users list by mounting folder containing *users* files in /users with the format :

```
user password home_dir
```

The `home_dir` can be a mounted volume from the host. This directory must be readable and writable by user 1000, gid 1000.

## Custom configuration

Put your custom conf in `/etc/proftpd/conf.d`

## Active Mode

The active mode of FTP require to publish the port 21 of the container.

```
docker run --name proftpd -d -p 21:21 -v $PWD/examples/users:/users tcoupin/rpi-proftpd
```

## Passive Mode

In this mode, the container must publish port 50000 to 50050 (see proftpd.conf). Since docker use NAT to publish port, you have to tell to proftpd your host ip (or your public ip). An example is in `example/conf.d`. Mount the `conf.d` at `/etc/proftpd/conf.d` (see custom conf section bellow).

```
docker run --name proftpd -d -p 21:21 -p 50000-50050:50000-50050 -v $PWD/examples/conf.d:/etc/proftpd/conf.d -v $PWD/examples/users:/users tcoupin/rpi-proftpd
```

## Custom Proftpd configuration

Proftpd read his configuration in /etc/prodtpd. You can provide your own  configuration in /proftpd to override the configuration.

