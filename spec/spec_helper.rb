require 'bundler/setup'
Bundler.setup

require 'watcher_on_the_wall'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end