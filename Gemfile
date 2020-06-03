source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Use Puma as the app server
gem 'puma', '~> 4.3.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'

# Support location based formatting using the Accept-Language request header
gem 'rails-i18n', '~> 6.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.2.3'

# Use Redis to cache database queries
gem 'redis', '~> 4.1.4'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.13'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.1.1'

# Use bootstrap_form for it's Action View helpers to get Bootstrap markup forms
gem 'bootstrap_form', '~> 4.5.0'

# Use to normalise form submissions
gem "auto_strip_attributes", '~> 2.6'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'

# Use for compression and internationalisation Rack middleware
gem 'rack-contrib', '~> 2.2.0'

# Use aws-sdk-s3 to connect to DigitalOcean Spaces for Active Storage
gem 'aws-sdk-s3', '~> 1.66.0', require: false

# Use to validate Active Storage uploads
gem "active_storage_validations", '~> 0.8.9'

# Use to transform Active Storage image variants
gem "image_processing", '~> 1.11'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4.6', require: false

# Use to query OpenStreetMap
# gem 'rosemary', '~> 0.4.4'

### Pinned dependencies

# Downgrade sprockets to v3 while sourcemaps are broken in Firefox (https://github.com/rails/sprockets/issues/649)
gem 'sprockets', '~> 3.7.2'

# Downgrade concurrent-ruby while it creates a thread on require (https://github.com/ruby-concurrency/concurrent-ruby/issues/868)
gem 'concurrent-ruby', '1.1.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 4.0.2'
  gem 'listen', '~> 3.2.1'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.1'

  # Code linting and formatting
  gem 'rcodetools', '~> 0.8.5', require: false
  gem 'rubocop', '~> 0.83.0', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.32.2'
  gem 'selenium-webdriver', '~> 3.142.7'

  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.3.0'
end
