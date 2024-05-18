FROM ruby:3.3.1-bullseye as base


ENV RUBY_VERSION=3.3.1

RUN mkdir /usr/src/app

WORKDIR /usr/src/app


COPY Gemfile Gemfile.lock ./

RUN apt-get update -qq && apt-get install -y build-essential apt-utils

RUN bundle install -j 4 --no-cache

# Root files
COPY .rubocop.yml\
  config.ru \
  Rakefile \
  ./

# Directories
COPY bin bin
COPY config config
COPY db db
COPY spec spec
COPY lib lib
COPY app app

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-u", "puma"]
