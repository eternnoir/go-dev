#
# Ubuntu 14.04 with golang develop env Dockerfile
#
# Pull base image.
FROM eternnoir/golang:latest
MAINTAINER Frank Wang <eternnoir@gmail.com>

#Update
RUN apt-get update && apt-get install -y software-properties-common
# Install develop use tool
RUN apt-get -y install \
                vim git curl mercurial \
                build-essential cmake \
                python-dev ctags tmux supervisor openssh-server
RUN apt-get clean
ENV HOME /root
WORKDIR /root
# Install YCM
RUN git clone --depth=1  https://github.com/Valloric/YouCompleteMe.git /root/.vim/bundle/YouCompleteMe
RUN cd /root/.vim/bundle/YouCompleteMe; git submodule update --init --recursive; ./install.sh

# Add config file
ADD vimrc /root/.vimrc
ADD tmux.conf /root/.tmux.conf

ENV PASSWD pwd
ENV USER_NAME dev

ADD startup.sh /
ADD supervisord.conf /
CMD ["sh", "/startup.sh"]
