# frozen_string_literal: true

# Use Rack::Deflater to compress responses with gzip.
Rails.application.config.middleware.insert_before(Rack::Sendfile, Rack::Deflater)
