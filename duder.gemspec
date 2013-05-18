# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'duder/version'

Gem::Specification.new do |spec|
  spec.name          = "duder"
  spec.version       = Duder::VERSION
  spec.authors       = ["Anthony White"]
  spec.email         = ["anthony.white.j@gmail.com"]
  spec.description   = %q{A simple giant bomb API client for ruby}
  spec.summary       = %q{Duder - a giant bomb API client}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['test/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "rest-client", "~> 1.6.7"
  spec.add_dependency "json", "~> 1.8.0"
end
