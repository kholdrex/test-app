require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)

    # Allow API
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '/api/*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options]
      end
    end

    config.active_record.raise_in_transactional_callbacks = true
  end
end
