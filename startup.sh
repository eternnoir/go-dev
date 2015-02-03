#!/bin/bash

mkdir /var/run/sshd
echo "User: dev Pass: $PASSWD"
useradd --create-home --shell /bin/bash --user-group --groups adm,sudo $USER_NAME
echo "dev:$PASSWD" | chpasswd
cp -R /root/.vim /home/$USER_NAME
cp /root/.vimrc /home/$USER_NAME
cp /root/.tmux.conf /home/$USER_NAME
echo "export GOPATH=/go" >> /home/$USER_NAME/.profile
echo "export GOROOT=/usr/local/go" >> /home/$USER_NAME/.profile
echo "export PATH=$PATH:$GOPATH/bin:$GOROOT/bin" >> /home/$USER_NAME/.profile
chown -R $USER_NAME /go
chown -R $USER_NAME /home/$USER_NAME
/usr/bin/supervisord -c /supervisord.conf
/bin/bash
