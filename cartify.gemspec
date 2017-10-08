
$:.push File.expand_path("../lib", __FILE__)

require "cartify/version"

Gem::Specification.new do |s|
  s.name        = "cartify"
  s.version     = Cartify::VERSION
  s.authors     = ["Eugene"]
  s.email       = ["Re4port@ukr.net"]
  s.homepage    = "https://github.com/GalenkoNeon/cartify"
  s.summary     = "Simple shopping cart."
  s.description = %q{Shopping cart with a multi-step checkout,
                     easily mounted into Rails application.}
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency "virtus", "~> 1.0.5"
  s.add_dependency "wicked", "~> 1.3.2"
  s.add_dependency "jquery-rails", "~> 4.3.1"
  s.add_dependency "country_select", "~> 3.1.1"
  s.add_dependency "draper", "~> 3.0.0"
  s.add_dependency "jquery_mask_rails", "~> 0.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry-byebug", "~> 3.5.0"
  s.add_development_dependency "rubocop", "~> 0.50.0"

end
