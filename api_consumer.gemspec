# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_consumer/version'

Gem::Specification.new do |spec|
  spec.name          = "api_consumer"
  spec.version       = ApiConsumer::VERSION
  spec.authors       = ["luxerama"]
  spec.email         = ["vincent@siebert.im"]
  spec.summary       = %q{API module}
  spec.description   = %q{API module to make the consumtion of standardised API responses easier}
  spec.homepage      = "https://github.com/thebeansgroup/api_consumer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency "activeresource", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'pry-rails'
  spec.add_development_dependency 'pry-stack_explorer'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency "rake"
end
