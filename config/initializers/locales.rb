# frozen_string_literal: true

# Use Rack::Locale to set locale based on the Accept-Language request header.
Rails.application.config.middleware.insert_before(Rack::ETag, Rack::Locale)

Rails.application.config.i18n.available_locales = [:en, 'en-GB', 'en-US']
