module Cartify
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'country_select'
    require 'jquery_mask_rails'
    require 'wicked'
    require 'virtus'
    require 'draper'
    require 'devise'
    require 'haml-rails'
    require 'pry-byebug'
    isolate_namespace Cartify

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.stylesheets false
      g.javascripts false
      g.template_engine :haml
    end

    # initializer :cartify, before: :load_config_initializers do

    #   config.paths['db/migrate'].expanded.each do |expanded_path|
    #     Rails.application.config.paths['db/migrate'] << expanded_path
    #   end
    # end

    initializer :inject_helpers do
      ActiveSupport.on_load :action_controller do
        ::ApplicationController.send(:helper, Cartify::Engine.helpers)
        ::ApplicationController.send(:include, Cartify::CurrentSession)
      end
    end
  end
end
