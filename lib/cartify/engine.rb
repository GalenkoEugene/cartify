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
  end
end
