# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rescue_up_to/version'

Gem::Specification.new do |spec|
  spec.name          = "rescue_up_to"
  spec.version       = RescueUpTo::VERSION
  spec.authors       = ["Samuel Rizzo"]
  spec.email         = ["rizzolabs@gmail.com"]
  spec.summary       = %q{Rescues / retries a block, up to a number of times.}
  spec.description   = %q{Rescues / retries a block, up to a number of times.}
  spec.homepage      = "http://github.com/srizzo/rescue_up_to"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = 'README.md'
  spec.rdoc_options.concat ['--main', 'README.md', '--line-numbers']

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "test-unit", "~> 3.0"
end
