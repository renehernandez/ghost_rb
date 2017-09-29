# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghost_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "ghost_rb"
  spec.version       = GhostRb::VERSION
  spec.authors       = ["Rene Hernandez"]
  spec.email         = ["renehr9102@gmail.com"]

  spec.summary       = %q{GhostRb is a REST API client to interact with a given Ghost blog}
  spec.homepage      = "https://github.com/renehernandez/ghost_rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|doc)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httpclient", "~> 2.8"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "yard"
end
