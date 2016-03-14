# This is a docker container to run JRiver Media Center as a headless server

FROM debian:jessie

ENV vncpass=jriver

# Install wget
RUN apt-get update && apt-get install -y \
	wget \
 && rm -rf /var/lib/apt/lists/*


# Add JRiver packages to apt-get
RUN wget -q "http://dist.jriver.com/mediacenter@jriver.com.gpg.key" -O- | apt-key add -

RUN wget http://dist.jriver.com/latest/mediacenter/mediacenter21jessie.list -O \
	/etc/apt/sources.list.d/mediacenter21.list


# Install JRiver and vnc
RUN apt-get update && apt-get install -y \
	mediacenter21 \
	openbox \
	supervisor \
	xvfb \
	x11vnc \
 && rm -rf /var/lib/apt/lists/*


# Copy script for running vnc desktop in docker
COPY dockapp-start dockapp-start


# Run supervisor for multiple processes
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# Expose ports and volumes
EXPOSE 5900
EXPOSE 52199
VOLUME /media 


CMD ["/usr/bin/supervisord"]


