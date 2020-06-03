FROM ruby:2.7.1

ENV PORT=80

# Install dependencies for Yarn, Active Storage and Postgres
RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

RUN mkdir -p tmp/pids

COPY . .

EXPOSE 80

CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]
