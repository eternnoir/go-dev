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
# Install tpope
RUN mkdir -p /root/.vim /root/.vim/autoload /root/.vim/bundle 
RUN curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install fatih/vim-go
RUN git clone --depth=1  https://github.com/fatih/vim-go.git /root/.vim/bundle/vim-go

# Install tagbar
RUN git clone --depth=1  https://github.com/majutsushi/tagbar.git /root/.vim/bundle/tagbar

# Install NerdTree 
RUN git clone --depth=1  https://github.com/scrooloose/nerdtree.git /root/.vim/bundle/nerdtree

# Install https://github.com/fatih/molokai.git
RUN git clone --depth=1  https://github.com/fatih/molokai.git /tmp/molokai
RUN cp -R /tmp/molokai/colors /root/.vim

# Install YCM
RUN git clone --depth=1  https://github.com/Valloric/YouCompleteMe.git /root/.vim/bundle/YouCompleteMe
RUN cd /root/.vim/bundle/YouCompleteMe; git submodule update --init --recursive; ./install.sh

# Install vim-javascript
RUN git clone --depth=1  https://github.com/pangloss/vim-javascript.git /root/.vim/bundle/vim-javascript

# Install Conque-Shell
RUN git clone --depth=1  https://github.com/eternnoir/Conque-Shell.git  /root/.vim/bundle/Conque-Shell

# Add config file
ADD vimrc /root/.vimrc
ADD tmux.conf /root/.tmux.conf

ENV PASSWD pwd
ENV USER_NAME dev

ADD startup.sh /
ADD supervisord.conf /
CMD ["sh", "/startup.sh"]
