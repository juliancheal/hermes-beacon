# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hermes_beacon/version'

Gem::Specification.new do |spec|
  spec.name          = "hermes_beacon"
  spec.version       = Hermes::Beacon::VERSION
  spec.authors       = ["Julian Cheal"]
  spec.email         = ["julian.cheal@gmail.com"]
  spec.summary       = "Herms-beacon scans for any available altbeacons/ibeacons"
  spec.description   = ""
  spec.homepage      = "http://github.com/juliancheal/hermes-beacon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "minitest", "~> 5.4"
  spec.add_development_dependency "pry"
  
  spec.add_runtime_dependency 'ffi', '~> 1.9'
  spec.add_runtime_dependency 'celluloid', '~> 0.16.0'
end
