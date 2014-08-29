FROM       ubuntu:14.04
MAINTAINER Roger Almeida <roger.eduardo@gmail.com>

RUN apt-get -qq update
RUN apt-get -qq -y install curl libpq-dev git-core build-essential libxslt-dev libxml2-dev postgresql-client-9.3

RUN /bin/bash -l -c "git clone https://github.com/sstephenson/rbenv.git /root/.rbenv"
RUN /bin/bash -l -c "git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build"
RUN /bin/bash -l -c "/root/.rbenv/plugins/ruby-build/install.sh"
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc
RUN /bin/bash -l -c "rbenv install 2.1.2"
ENV PATH /.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/bundler-1.7.0/bin:$PATH
ENV PATH /.rbenv/versions/2.1.2/bin:$PATH

RUN /bin/bash -l -c "mkdir -p /var/bundle"
RUN /bin/bash -l -c "mkdir -p /var/www/"
