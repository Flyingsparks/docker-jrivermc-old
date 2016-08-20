# flyingsparks/jrivermc

![](https://www.jriver.com/images/header/logo.png)

[JRiver Media Center](https://www.jriver.com/) is a media manager and player providing high quality playback of audio and video. Its scope includes almost all formats of audio, video, and images. Media Center can also record television and manage documents. It also provides a media network to stream your media across multiple devices.

## Usage

```
docker run -d \
	--name=jriver \
	-h <hostname> \
	-v /etc/localtime:/etc/localtime:ro \
	-v <path to data>:/media \
	-e vncpass=<passwd> \
	-p 5900:5900 \
	-p 52199:52199 \
	flyingsparks/jrivermc
```

**Parameters**

* `-h` - the hostname of the container. JRiver uses this to identify libraries.
* `-p 5900` - the vnc port(s)
* `-p 52199` - the JRiver port
* `-v /etc/localhost` for timesync - *optional*
* `-v /media` - Media Share
* `-e vncpass` - sets the vnc password, defaults to jriver


It is based on debian:jessie with ssh removed, for shell access whilst the container is running do `docker exec -it jriver /bin/bash -l`.

This container uses openbox as a light weight windows manager. JRiver starts minimised with the `/mediaserver` switch. Right click to show existing windows.

## To Do

* Test passing audio device.
* Add updating.
* Add volume mount for JRiver config.

## Version Log

+ **20.08.16:** Updating to JRiver Media Center 22. Final release with JRiver 21 is tagged 21-final
+ **14.03.16:** Initial release. 

