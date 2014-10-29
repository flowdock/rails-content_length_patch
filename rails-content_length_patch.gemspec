# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/content_length_patch/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-content_length_patch"
  spec.version       = Rails::ContentLengthPatch::VERSION
  spec.authors       = ["Ville Lautanala"]
  spec.email         = ["lautis@gmail.com"]
  spec.summary       = "Content-Length monkey patch for Rails <= 4.1"
  spec.description   = "Monkey patch for Rails that adds Content-Length header to responses."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", ">= 4.0", "< 4.2"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "activesupport", "~> 4.0"
  spec.add_development_dependency "rack"
  spec.add_development_dependency "minitest"
end
