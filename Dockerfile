FROM ruby:2.7.1

ENV PORT=80

# Configure Bundler
RUN bundle config --global frozen 1 && \
    bundle config set deployment 'true' && \
    bundle config set path 'vendor/bundle' && \
    bundle config set without 'development:test'

# Install dependencies for Node.js, Yarn, Active Storage and Postgres
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update && apt-get install -y --no-install-recommends \
    nodejs \
    imagemagick \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

WORKDIR /usr/src/app

RUN mkdir -p tmp/pids

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN bundle exec rake assets:precompile assets:clean

EXPOSE 80

RUN [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]
