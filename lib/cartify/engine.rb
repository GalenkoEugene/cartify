module Cartify
  class Engine < ::Rails::Engine
    isolate_namespace Cartify

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.stylesheets false
      g.javascripts false
      g.template_engine :haml
    end

    initializer 'cartify', before: :load_config_initializers do |app|
      config.paths['db/migrate'].expanded.each do |expanded_path|
        Rails.application.config.paths['db/migrate'] << expanded_path
      end
    end

    # initializer :inject_helpers do |app|
    #   ActiveSupport.on_load :action_controller do
    #     ::ActionController::Base.send(:helper, Cartify::Engine.helpers)
    #   end
    # end
  end
end
