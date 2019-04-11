FROM centos:6.7
LABEL nooldey "nooldey@gmail.com"

# Add Root & User
RUN /bin/echo 'root:159753'|chpasswd
RUN useradd nooldey
RUN /bin/echo 'nooldey:159753'|chpasswd
RUN /bin/echo -e "LANG=\"en_US.UTF-8\"" >/etc/default/local

# Expose ports
EXPOSE 22
EXPOSE 80

# Install Base packages
RUN yum -y install wget tar git

# Install GoLang Enviroment
RUN wget https://dl.google.com/go/go1.12.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.12.3.linux-amd64.tar.gz
RUN /bin/echo "export PATH=$PATH:/usr/local/go/bin"
RUN /bin/echo "export GOPATH=$HOME/go"
RUN go version

# Open SSH
CMD /usr/sbin/sshd -D