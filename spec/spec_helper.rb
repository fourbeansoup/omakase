require 'rubygems'
require 'rails'
require 'bundler'

Bundler.require :default, :test

require 'capybara/rspec'

Combustion.initialize! :active_record, :action_controller
                       :action_view

require 'rspec/rails'
require 'capybara/rails'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
