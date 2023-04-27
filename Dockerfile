# syntax=docker/dockerfile:1
FROM ruby:3.0.2


RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client

WORKDIR /rails-project

COPY .  .
COPY Gemfile /rails-project/Gemfile
COPY Gemfile.lock /rails-project/Gemfile.lock

RUN bundle install

# precompile bootsnnap code for faster booting eddy
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

# CMD ["sleep", "1000"]
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]