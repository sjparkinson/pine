# frozen_string_literal: true

# Use the lowest log level as a default to ensure availability of diagnostic information
# when problems arise.
Rails.application.config.log_level = ENV.fetch('LOG_LEVEL', 'debug').to_sym
