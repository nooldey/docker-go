FROM centos:6.7
MAINTAINER Nooldey "nooldey@gmail.com"

RUN /bin/echo 'root:159753'|chpasswd
RUN useradd nooldey
RUN /bin/echo 'nooldey:159753'|chpasswd
RUN /bin/echo -e "LANG=\"en_US.UTF-8\"" >/etc/default/local

EXPOSE 22
EXPOSE 80

CMD /usr/sbin/sshd -D