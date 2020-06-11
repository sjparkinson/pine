# frozen_string_literal: true

I18n.load_path += Dir[Rails.root.join('locales', '*.yml')]

I18n.available_locales = [:en]

I18n.default_locale = :en
