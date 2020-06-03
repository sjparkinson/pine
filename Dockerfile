FROM ruby:2.7.1

ENV PORT=80

# Install Bundler
RUN gem install bundler

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

RUN SECRET_KEY_BASE=disabled RAILS_ENV=production \
    bundle exec rails assets:precompile && \
    rm -rf tmp

EXPOSE 80

CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]
