require_relative "boot"
require "rails/all"

# If you're not using Active Record (i.e., no DB), remove it from the list:
# require "rails/all" includes ActiveRecord. Replace it with only the frameworks you want:

# require "action_controller/railtie"
# require "action_view/railtie"
# require "sprockets/railtie"

Bundler.require(*Rails.groups)

module InOutBurgerMenu
  class Application < Rails::Application
    config.load_defaults 7.0

    # You can disable ActiveRecord here if not using a DB:
    config.api_only = false

    # Remove ActiveRecord
    config.generators do |g|
      g.orm :null
    end
  end
end
