FROM ruby:2.7

LABEL maintainer="Brett Dudo <brett@dudo.io>"

# Install dependencies
# - build-essential: To ensure certain gems can be compiled
# - libpq-dev postgresql-client: Communicate with postgres through the postgres gem
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client redis

WORKDIR /usr/src/app

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure bundler
ENV LANG C.UTF-8
ENV GEM_HOME /usr/local/bundle

ADD Gemfile* ./
RUN gem update --system && \
    gem install bundler
RUN bundle config set without 'test development' && \
    bundle install --jobs 4 --retry 3

ADD . ./

EXPOSE 50052

# Start app
ENTRYPOINT  [ "bundle" ]
CMD [ "exec", "server.rb" ]
