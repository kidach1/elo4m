# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elo4m/version'

Gem::Specification.new do |spec|
  spec.name          = "elo4m"
  spec.version       = Elo4m::VERSION
  spec.authors       = ["kidach1"]
  spec.email         = ["daiki.taniguchi@aktsk.jp"]
  spec.summary       = %q{For calculating the relative skill levels of players in multi-player games.}
  spec.description   = %q{For calculating the relative skill levels of players in multi-player games.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
