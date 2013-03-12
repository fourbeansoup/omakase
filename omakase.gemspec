$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "omakase/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "omakase"
  s.version     = Omakase::VERSION
  s.authors     = ["Josh Owens"]
  s.email       = ["joshua.owens@gmail.com"]
  s.homepage    = "https://github.com/fourbeansoup/omakase"
  s.summary     = "A rails engine that tracks noted changes from commit messages to show to customers"
  s.description = "Coming soon"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.12"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
