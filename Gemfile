source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Use Puma as the app server
gem 'puma', '~> 4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.2'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.1'

# Use bootstrap_form for it's Action View helpers to get Bootstrap markup forms
gem 'bootstrap_form', '~> 4.5'

# Display dates and times in the users local timezone
gem "local_time", "~> 2.1"

# Adds support for Brotli compressed assets
gem 'sprockets-exporters_pack', '~> 0.1'

# Use to normalise form submissions
gem 'auto_strip_attributes', '~> 2.6'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'

# Used for compression and internationalisation Rack middleware
gem 'rack-contrib', '~> 2.2'

# Use aws-sdk-s3 to connect to DigitalOcean Spaces for Active Storage
gem 'aws-sdk-s3', '~> 1.66', require: false

# Used to validate Active Storage uploads
gem 'active_storage_validations', '~> 0.8'

# Used to transform Active Storage image variants
gem 'image_processing', '~> 1.11'
gem 'ruby-vips', '~> 2.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4', require: false

# Use lograge to format production logs
gem 'lograge', '~> 0.11'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'dotenv-rails', '~> 2.7'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 4.0'
  gem 'listen', '~> 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0'

  # Code linting and formatting
  gem 'rcodetools', '~> 0.8', require: false
  gem 'rubocop', '~> 0.82', require: false
  gem 'code-scanning-rubocop', '~> 0.3', require: false
  gem 'reek', '~> 6.0', require: false

  # Debugging tool
  gem 'rbtrace', '~> 0.4'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.32'
  gem 'selenium-webdriver', '~> 3.142'

  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.3'
end
