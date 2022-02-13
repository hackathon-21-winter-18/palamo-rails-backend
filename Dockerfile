FROM ruby:3.1.0
ENV DOCKERIZE_VERSION v0.6.1
ENV TZ Asia/Tokyo

RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN mkdir /app

COPY Gemfile /app
COPY Gemfile.lock /app

WORKDIR /app

RUN gem install bundler && bundle install
# RUN bundle exec rails db:create
