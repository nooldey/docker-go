FROM centos:6.7
LABEL Author "nooldey@gmail.com"

# Add Root & User
RUN /bin/echo "# Initial User settings..."                                                          \ 
    && /bin/echo 'root:159753'|chpasswd                                                             \ 
    && useradd nooldey                                                                              \ 
    && /bin/echo 'nooldey:159753'|chpasswd                                                          \ 
    && /bin/echo -e "LANG=\"en_US.UTF-8\"" >/etc/default/local                                      \ 
    && echo "# Install Base packages..."                                                            \ 
    && yum -y install wget tar                                                                      \ 
    && echo "# Install GoLang Enviroment..."                                                        \ 
    && wget https://dl.google.com/go/go1.12.3.linux-amd64.tar.gz                                    \ 
    && tar -C /usr/local -xzf go1.12.3.linux-amd64.tar.gz                                           \
    && rm -f go1.12.3.linux-amd64.tar.gz                                                            \
    && /bin/echo -e "export PATH=$PATH:/usr/local/go/bin\nexport GOPATH=$HOME/go" >>/etc/profile    \
    && source /etc/profile     \
    && yum clean packages
# Expose ports
EXPOSE 22
EXPOSE 80

# Active Golang
CMD ["source /etc/profile"]
