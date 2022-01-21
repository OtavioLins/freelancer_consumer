FROM ruby:3.0.2

ENV INSTALL_PATH /opt/app

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update

RUN apt-get install -y nodejs
RUN npm install -g yarn

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY . .