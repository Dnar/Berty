FROM ruby:2.3.3

MAINTAINER dinar@qlean.ru

ENV PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev && \
    curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    mv $PHANTOM_JS /usr/local/share && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN mkdir -p /autotests
WORKDIR /autotests

ADD Gemfile* ./
RUN bundle install

COPY . /autotests
