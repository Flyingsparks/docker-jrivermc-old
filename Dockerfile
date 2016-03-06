# This is a docker container to run JRiver Media Center as a headless server

FROM debian:jessie

EXPOSE 5900

RUN wget -q "http://dist.jriver.com/mediacenter@jriver.com.gpg.key" -O- \
	| sudo apt-key add - \
 && wget http://dist.jriver.com/latest/mediacenter/mediacenter21jessie.list -O \
	/etc/apt/sources.list.d/mediacenter21.list

RUN apt-get update && apt-get install -y \
	mediacenter21 \
	xrdp \
 && rm -rf /var/lib/apt/lists/*

CMD ["mediacenter21","\mediaserver"] 