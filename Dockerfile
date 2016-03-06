# This is a docker container to run JRiver Media Center as a headless server

FROM debian:jessie

EXPOSE 5900
EXPOSE 52199

RUN wget -q "http://dist.jriver.com/mediacenter@jriver.com.gpg.key" -O- \
	| apt-key add - \
 && wget http://dist.jriver.com/latest/mediacenter/mediacenter21jessie.list -O \
	/etc/apt/sources.list.d/mediacenter21.list

RUN apt-get update && apt-get install -y \
	mediacenter21 \
	tightvncserver \
 && rm -rf /var/lib/apt/lists/*

RUN echo "jriver" | tightvncserver -f > $HOME/.vnc/passwd \
	&& chmod 600 $HOME/.vnc/passwd

COPY StartMC21.sh /etc/

CMD ["StartMC21.sh"] 
