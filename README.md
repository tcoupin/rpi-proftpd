# rpi-proftpd

A docker image of proftpd for RaspberryPi, based on resin/rpi-raspbian:jessie

## Users

You can provide your users list by mounting folder containing a *users* file at /proftpd with the format :

```
user password home_dir
```

The `home_dir` can be a mounted volume from the host.

## Active Mode

The active mode of FTP require to publish the port 21 of the container.

```
docker run --name proftpd -d -p 21:21 -v /path/to/your/users:/users tcoupin/rpi-proftpd
```

## Passive Mode

In this mode, the container must publish port 50000 to 50050 (see proftpd.conf). Since docker use NAT to publish port, you have to tell to proftpd your host ip (or your public ip). An example is in `conf.d`. Mount the `conf.d` at `/proftpd/conf.d` (see custom conf section bellow).

```
docker run --name proftpd -d -p 21:21 -p 50000-50050:50000-50050 -v $(pwd)/conf.d:/proftpd/conf.d -v /path/to/your/users:/users tcoupin/rpi-proftpd
```

## Custom Proftpd configuration

Proftpd read his configuration in /etc/prodtpd. You can provide your own  configuration in /proftpd to override the configuration.

