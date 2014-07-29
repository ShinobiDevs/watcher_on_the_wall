# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watcher_on_the_wall/version'

Gem::Specification.new do |spec|
  spec.name          = "watcher_on_the_wall"
  spec.version       = WatcherOnTheWall::VERSION
  spec.authors       = ["Elad Meidar"]
  spec.email         = ["elad@eizesus.com"]
  spec.summary       = "WatcherOnTheWall aims to provide a single instance mutual exclusion lock for running ruby scripts"
  spec.description   = "This gem uses Redis to provide a mutex lock and to ensure certain processes do not overlap each other."
  spec.homepage      = "https://github.com/ShinobiDevs/watcher_on_the_wall"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_dependency 'redis'
end
