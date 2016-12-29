# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'debride2okuribito/version'

Gem::Specification.new do |spec|
  spec.name          = "debride2okuribito"
  spec.version       = DebrideToOkuribito::VERSION
  spec.authors       = ["Yasuhiro Matsumura"]
  spec.email         = ["ym.contributor@gmail.com"]

  spec.summary       = "It converts the execution result of 'Debride' to yaml for 'Okuribito'."
  spec.description   = "It converts the execution result of 'Debride' to yaml for 'Okuribito'."
  spec.homepage      = "https://github.com/muramurasan/debride2okuribito"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "exe/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = ["debride2okuribito"]
  spec.require_paths = ["lib"]

  spec.add_dependency "debride"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov"
end
