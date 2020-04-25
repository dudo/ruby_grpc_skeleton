FROM ruby:2.6-slim

LABEL maintainer="Your Name <you@name.io>"

# Install dependencies
# - build-essential: To ensure certain gems can be compiled
# - libpq-dev postgresql-client: Communicate with postgres through the postgres gem
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client redis

WORKDIR /usr/src/app

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure bundler
ENV LANG C.UTF-8
ENV GEM_HOME /usr/local/bundle

ADD Gemfile* ./
RUN gem update --system
RUN gem install bundler
RUN bundle install -j4 --retry 3

ADD . ./

EXPOSE 50052
ENTRYPOINT ["bundle", "exec"]
CMD ["server.rb"]
