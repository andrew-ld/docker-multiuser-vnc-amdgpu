FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y lightdm xfce4 xfce4-goodies
RUN apt-get install -y xserver-xorg-video-dummy
RUN apt-get clean

COPY ./bintray/tigervnc.tar.gz /
RUN tar xz --strip 1 -C / -f /tigervnc.tar.gz
RUN rm /tigervnc.tar.gz

COPY ./common/lightdm/ /etc/lightdm/lightdm.conf.d/
COPY ./common/xorg/ /usr/share/X11/xorg.conf.d/

COPY ./common/startup.sh /
RUN chmod 700 /startup.sh

COPY ./private/post_install.sh /
COPY ./private/passwd /

RUN bash /post_install.sh
RUN rm /post_install.sh

COPY ./private/cert /cert
RUN chmod -R 300 /cert

ENTRYPOINT ["/startup.sh"]
EXPOSE 5900
